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
    sleep 3
    event_parser
  end

  def stop
    @getter.stop
    @event_thread.exit
  end

  private

  def live_json 
    Struct.new
  end

  def event_parser
    @event_thread = Thread.new do
      loop do
        puts Benchmark.measure {
          @events = Parser::Fonbet::Event::Collection.new(@getter.live_json).parse
        }
        sleep 1
      end
    end
  end


end
