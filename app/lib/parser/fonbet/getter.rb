class Parser::Fonbet::Getter
  HOST = 'https://line18.bkfon-resources.com'.freeze
  attr_reader :live_json_ru, :live_json_en

  def start
    start_thread
  end

  def stop
    @live_thread.exit
  end

  def status
    p @live_thread.status
  end

  def live_json
    struct = Struct.new(:ru, :en)
    struct.new(@live_json_ru, @live_json_en)
  end

  private

  def start_thread
    @live_thread = Thread.new do
      loop do
        @live_json_ru = JSON.parse(get_json(lang: 'ru', type: 'live'))
        @live_json_en = JSON.parse(get_json(lang: 'en', type: 'live'))
        sleep 0.4
      end
    end
  end

  def get_json(lang:, type:)
    Net::HTTP.get(URI.parse(url(lang: lang, type: type)))
  end

  def url(lang:, type:)
    "#{HOST}/#{type}/updatesFromVersion/4507896552/#{lang}/?dd5qwvz0l7skgtodpic"
  end
end
