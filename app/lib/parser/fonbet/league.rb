class Parser::Fonbet::League
  @@league_ids = {}

  def initialize(sport_id:, live_json:)
    @sport_id = sport_id
    @live_json = live_json
  end

  def parse
    create_league
  end

  private

  def create_league
    return cache_league if cache_league

    league = League.find_or_create_by! name_ru: league_ru['name'],
                                       name_en: league_en['name'],
                                       bookmaker: Bookmaker.find(1),
                                       sport: Sport.find(1),
                                       sex: 0,
                                       external_id: external_id,
                                       slug: slug
    write_cache(league)
  end

  def cache_league
    @cache_league ||= @@league_ids[external_id] if external_id
  end

  def external_id
    @external_id ||= league_ru['id'] rescue nil
  end

  def write_cache(league)
    @@league_ids[external_id] = league
  end

  def slug
    "#{league_ru['name'].downcase.delete('.').delete('-').gsub(' ', '_').html_safe}_#{external_id}"
  end
  

  def league_ru
    @league_ru ||= @live_json.ru['sports'].find { |sport| sport['id'] == @sport_id }
  end

  def league_en
    @league_en ||= @live_json.ru['sports'].find { |sport| sport['id'] == @sport_id }
  end
end
