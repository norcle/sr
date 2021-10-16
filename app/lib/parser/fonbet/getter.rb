class Parser::Fonbet::Getter
  HOST = 'line18.bkfon-resources.com'.freeze
  attr_reader :live_thread

  def initialize(sleep_time: 0.5, enable_loop: true)
    @sleep_time = sleep_time
    @loop = enable_loop
    @multilang = Struct.new(:ru, :en)
  end

  def start
    start_thread
  end

  def stop
    @live_thread.exit
  end

  def status
    @live_thread.status
  end

  def live_json
    @multilang.new(@live_json_ru, @live_json_en)
  end

  private

  def start_thread
    @live_thread = Thread.new do
      loop do
        parse
        break unless @loop

        sleep @sleep_time
      end
    end
  end

  def parse
    @live_json_ru = JSON.parse(get_json(lang: 'ru', type: 'live'))
    @live_json_en = JSON.parse(get_json(lang: 'en', type: 'live'))
  end

  def get_json(lang:, type:)
    Net::HTTP.get(URI.parse(url(lang: lang, type: type)))
  end

  def url(lang:, type:)
    "http://#{HOST}/#{type}/updatesFromVersion/4507896552/#{lang}/?dd5qwvz0l7skgtodpic"
  end
end
