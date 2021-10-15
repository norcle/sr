class Parser::Fonbet::Event::Collection
  def initialize(live_json)
    @events_collection = []
    @live_json = live_json
  end

  def parse
    ActiveRecord::Base.transaction do
      events&.each do |event|
        event = { ru: event, en: en_event(event['id']) }
        next if event[:en].nil? || event[:ru].nil?

        @events_collection << Parser::Fonbet::Event::Entity.new(event, live_json: @live_json).parse
      end
    end
    @events_collection
  end

  private

  def events
    @events ||= filter_events_ru.select { |event| event['level'] == 1 } rescue []
  end

  def en_event(id)
    filter_events_en.find { |event| event['id'] == id } rescue nil
  end

  def filter_events_ru
    @filter_events_ru ||= @live_json.ru['events']
  end

  def filter_events_en
    @filter_events_en ||= @live_json.en['events']
  end
end
