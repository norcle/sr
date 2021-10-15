class Parser::Fonbet::Team
  @@teams = {}

  def initialize(team_id:, team_names:, league:)
    @team_id = team_id
    @team_names = team_names
    @league = league
  end

  def parse
    p create_team
  end

  private

  def create_team
    return read_cache if read_cache

    team = Team.find_or_create_by! name_ru: @team_names[:ru],
                                   name_en: @team_names[:en],
                                   bookmaker: Bookmaker.find(1),
                                   sport: Sport.find(1),
                                   sex: @league.sex,
                                   league: @league,
                                   external_id: @team_id,
                                   slug: slug
    write_cache(team)
  end

  def slug
    "#{@team_names[:en].downcase.delete('.').delete('-').gsub(' ', '_').html_safe}_#{@team_id}"
  end

  def read_cache
    @read_cache ||= @@teams[@team_id]
  end

  def write_cache(team)
    @@teams[@team_id] = team
  end
end
