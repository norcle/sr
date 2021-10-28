class Parser::Fonbet::Event::Entity
  @@events = {}
  attr_reader :league, :team1, :team2
  def initialize(event_json, live_json:)
    @event_json = event_json
    @live_json = live_json
  end

  def parse
    return read_cache if read_cache
    event = Event.find_or_create_by! external_id: id,
                                     team1: team1,
                                     team2: team2,
                                     league: league,
                                     bookmaker_id: 1,
                                     sport_id: 1,
                                     level: 1,
                                     slug: slug
    write_cache(event)
  end

  def self.clear_cache
    @@events = {}
  end

  private

  def cached_events
    @@events
  end

  def read_cache
    @read_cache ||= @@events[id]
  end

  def write_cache(event)
    @@events[id] = event
  end

  def slug
    "#{team1.slug}_#{team2.slug}"
  end

  def team1
    @team1 ||= Parser::Fonbet::Team.new(team_id: team_id(1), team_names: team_names(1), league: league).parse
  end

  def team2
    @team2 ||= Parser::Fonbet::Team.new(team_id: team_id(2), team_names: team_names(2), league: league).parse
  end

  def league
    @league ||= Parser::Fonbet::League.new(sport_id: @event_json[:ru]['sportId'], live_json: @live_json).parse
  end

  def id
    @id ||= @event_json[:ru]['id']
  end

  def team_id(num)
    @event_json[:ru]["team#{num}Id"]
  end

  def team_names(num)
    {
      ru: @event_json[:ru]["team#{num}"],
      en: @event_json[:en]["team#{num}"]
    }
  end
end
