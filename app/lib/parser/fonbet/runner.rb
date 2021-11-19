class Parser::Fonbet::Runner
  attr_reader :getter, :event_thread, :factor_thread

  def initialize(options = [])
    @events = []
    @parts = []
    @getter = options.delete(:getter) || Parser::Fonbet::Getter.new
    @event_parser = options.delete(:event_parser) || Parser::Fonbet::Event::Collection
    @part_parser = options.delete(:part_parser) || Parser::Fonbet::Event::Part
    @factor_parser = options.delete(:factor_parser) || Parser::Fonbet::Factor::Collection
  end

  def status
    {
      event: @event_thread.status,
      factor: @factor_thread.status,
      getter: @getter.status
    }
  end

  def restart
    stop
    start
  end

  def problem?
    return true if status[:event].nil? ||  status[:event] == false ||  status[:event] == 'aborting'
    return true if status[:factor].nil? ||  status[:factor] == false ||  status[:factor] == 'aborting'
    return true if status[:getter].nil? ||  status[:getter] == false ||  status[:getter] == 'aborting'
  end

  def start
    @getter.start
    event_parser
    part_parser
    factor_parser
  end

  def stop
    @getter.stop
    @event_thread.exit
    @factor_thread.exit
  end

  private

  def event_parser
    @event_thread = Thread.new do
      loop do
        sleep 0.9
        next if Rails.env.test?

        @events = @event_parser.new(@getter.live_json).parse
      end
    end
  end

  def part_parser
    @part_thread = Thread.new do
      loop do
        sleep 2
        next if Rails.env.test?

        @parts  = @part_parser.new(@getter.live_json).parse
      end
    end
  end

  def factor_parser
    @factor_thread = Thread.new do
      loop do
        sleep 0.7
        next if Rails.env.test?

        puts Benchmark.measure {
          @factor_parser.new(@events, live_json: @getter.live_json).parse unless @events == []
          @factor_parser.new(@parts, live_json: @getter.live_json).parse unless @parts == []
        }
      end
    end
  end
end
