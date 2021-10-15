class Parser::Fonbet::Runner
  HOST = 'https://line18.bkfon-resources.com'.freeze

  def initialize
    @getter = Parser::Fonbet::Getter.new
  end

  def status
    p @event_thread.status
    p @getter.status
  end

  def start
    @getter.start
    sleep 1
    event_parser
    factor_parser
  end

  def stop
    @getter.stop
    @event_thread.exit
    @factor_thread.exit
  end

  private

  def live_json 
    Struct.new
  end

  def event_parser
    @event_thread = Thread.new do
      loop do
        @events = Parser::Fonbet::Event::Collection.new(@getter.live_json).parse
        sleep 0.9
      end
    end
  end

  def factor_parser
    @factor_thread = Thread.new do
      loop do
        p 'factor'
        puts Benchmark.measure {
          Parser::Fonbet::Factor::Collection.new(@events, live_json: @getter.live_json).parse
        }
        sleep 0.7
      end
    end
  end
end
