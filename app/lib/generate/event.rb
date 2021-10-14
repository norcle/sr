class Generate::Event
  attr_reader :event, :sport, :bookmaker

  def initialize(sport: Sport.find(1), bookmaker: Bookmaker.find(1))
    @sport = sport
    @bookmaker = bookmaker
  end

  def generate
    @event = create_event
  end

  private

  def create_event
    Event.create! sport: @sport,
                 bookmaker: @bookmaker,
                 league: create_league,
                 team1: create_team1,
                 team2: create_team2,
                 level: 1,
                 slug: "test_event_#{rand(1000)}"
  end

  def create_league
    League.find_or_create_by!(name_ru: 'Тестовая лига',
                             name_en: 'Test League',
                             slug: 'test_league',
                             sex: 0,
                             bookmaker: @bookmaker,
                             sport: @sport)
  end

  def create_team1
    Team.find_or_create_by!(name_ru: 'Team1',
                           name_en: 'Team1',
                           slug: 'team1',
                           external_id: 'team1',
                           sex: 0,
                           bookmaker: @bookmaker,
                           sport: @sport)
  end

  def create_team2
    Team.find_or_create_by!(name_ru: 'Team2',
                           name_en: 'Team2',
                           slug: 'team2',
                           external_id: 'team2',
                           sex: 0,
                           bookmaker: @bookmaker,
                           sport: @sport)
  end
end
