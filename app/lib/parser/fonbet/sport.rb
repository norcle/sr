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

    sport = Sport.find_by name_ru: sport_ru['name']
    write_cache(sport)
  end

  def cache_sport
    @cache_sport ||= @@sport_ids[parent_id] if parent_id
  end

  def write_cache(sport)
    @@sport_ids[parent_id] = sport
  end

  def sport_ru
    @sport_ru ||= @live_json.ru['sports'].find { |sport| sport['id'] == parent_id }
  end

  def parent_id
    league_ru['parentId']
  end

  def league_ru
    @league_ru ||= @live_json.ru['sports'].find { |sport| sport['id'] == @sport_id }
  end
end
