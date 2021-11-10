class Parser::Fonbet::Sport
  @@sport_ids = {}

  def initialize(sport_id:, live_json:)
    @sport_id = sport_id
    @live_json = live_json
  end

  def parse
    create_sport
  end

  def self.clear_cache
    @@sport_ids = {}
  end

  private

  def create_sport
    return cache_sport if cache_sport

    sport = Sport.find_or_create_by! name_ru: sport_ru['name'],
                                     name_en: sport_en['name'],
                                     slug: slug
    write_cache(sport)
  end

  def cache_sport
    @cache_sport ||= @@sport_ids[external_id] if external_id
  end

  def write_cache(sport)
    @@sport_ids[external_id] = sport
  end

  def external_id
    @external_id ||= parent_id['id'] rescue nil
  end

  def slug
    "#{sport_en['name'].downcase.delete('.').delete('-').gsub(' ', '_').html_safe}_#{external_id}"
  end

  def sport_ru
    @sport_ru ||= @live_json.ru['sports'].find { |sport| sport['id'] == parent_id }
  end

  def sport_en
    @sport_en ||= @live_json.en['sports'].find { |sport| sport['id'] == parent_id }
  end

  def parent_id
    league_ru['parentId']
  end

  def league_ru
    @league_ru ||= @live_json.ru['sports'].find { |sport| sport['id'] == @sport_id }
  end
end
