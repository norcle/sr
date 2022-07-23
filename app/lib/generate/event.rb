class Generate::Event
  attr_reader :event, :sport, :bookmaker, :threads

  FACTORS = [{ key: FactorKey.find(1),  random_value: Generate::Value::Score },
             { key: FactorKey.find(2),  random_value: Generate::Value::Score },
             { key: FactorKey.find(10), random_value: Generate::Value::Kef },
             { key: FactorKey.find(11), random_value: Generate::Value::Kef },
             { key: FactorKey.find(12), random_value: Generate::Value::Kef },
             { key: FactorKey.find(13), random_value: Generate::Value::Kef },
             { key: FactorKey.find(14), random_value: Generate::Value::Kef },
             { key: FactorKey.find(16), random_value: Generate::Value::Kef, random_parameter: Generate::Parameter::Total },
             { key: FactorKey.find(17), random_value: Generate::Value::Kef, random_parameter: Generate::Parameter::Total },
             { key: FactorKey.find(18), random_value: Generate::Value::Kef, random_parameter: Generate::Parameter::Total },
             { key: FactorKey.find(19), random_value: Generate::Value::Kef, random_parameter: Generate::Parameter::Total },
             { key: FactorKey.find(20), random_value: Generate::Value::Kef, random_parameter: Generate::Parameter::Fora },
             { key: FactorKey.find(21), random_value: Generate::Value::Kef, random_parameter: Generate::Parameter::Fora }
            ].freeze

  def initialize(sport: Sport.find(1), bookmaker: Bookmaker.find(1), live_mode: false, repeats: 50)
    @threads = []
    @sport = sport
    @bookmaker = bookmaker
    @live_mode = live_mode
    @repeats = repeats
  end

  def generate
    @event = create_event
    generate_factors
    @event
  end

  def self.clear_events
    # Очистить все
  end

  private

  def generate_factors
    FACTORS.each do |factor|
      factors = Generate::Factor.new @event,
                                     factor_key: factor[:key],
                                     live_mode: @live_mode,
                                     step_time: 0.5.second,
                                     repeats: 50,
                                     random_value: factor[:random_value],
                                     random_parameter: factor[:random_parameter],
                                     repeats: @repeats
      @threads << factors.generate
    end
  end

  def create_event
    Event.create! sport: @sport,
                  bookmaker: @bookmaker,
                  league: create_league,
                  team1: create_team1,
                  team2: create_team2,
                  level: 1,
                  slug: "test_event_#{Random.rand(1000)}"
  end

  def create_league
    @create_league ||= League.find_or_create_by! name_ru: 'Тестовая лига',
                                                 name_en: 'Test League',
                                                 slug: 'test_league',
                                                 sex: 0,
                                                 bookmaker: @bookmaker,
                                                 sport: @sport
  end

  def create_team1
    Team.find_or_create_by! name_ru: 'Team1',
                            name_en: 'Team1',
                            slug: 'team1',
                            external_id: 'team1',
                            sex: 0,
                            league: create_league,
                            bookmaker: @bookmaker,
                            sport: @sport
  end

  def create_team2
    Team.find_or_create_by! name_ru: 'Team2',
                            name_en: 'Team2',
                            slug: 'team2',
                            external_id: 'team2',
                            sex: 0,
                            league: create_league,
                            bookmaker: @bookmaker,
                            sport: @sport
  end
end
