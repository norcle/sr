require 'rails_helper'

RSpec.describe Parser::Fonbet::Team do
  let(:live_json) do
    @multilang = Struct.new(:ru, :en)
    @ru = JSON.parse(open('spec/fixtures/json/fonbet.json').read)
    @multilang.new(@ru, @ru)
  end
  let(:event) do
    ru = {
      id: 30516658,
      sortOrder: '1a007c9-oOKm',
      level: 1,
      num: 39435,
      sportId: 71239,
      kind: 1,
      rootKind: 1,
      state: {willBeLive: true},
      team1Id: 377094,
      team2Id: 400908,
      team1: 'Цзилинь Нортист Тайгерз',
      team2: 'Нанкин Манки Кингс',
      statisticsType: 'BetRadar',
      name: '',
      namePrefix: '',
      startTime: 1634358600,
      place: 'live',
      priority: 4
    }
    { 'ru': ru, 'en': ru }.with_indifferent_access
  end
  let(:team_names) do
    {
      ru: event[:ru]["team1"],
      en: event[:en]["team1"]
    }
  end
  let(:team) { described_class.new(team_id: event['ru']['team1Id'], league: create(:league), team_names: team_names) }

  before do
    Parser::Fonbet::Event::Entity.clear_cache
    Parser::Fonbet::League.clear_cache
    Parser::Fonbet::Team.clear_cache
  end

  describe 'public' do
    it 'parse' do
      team.parse
      team_db = Team.find_by(external_id: event['ru']['team1Id'])
      expect(team_db).to be_truthy
      expect(team_db.name_ru).to match(event['ru']['team1'])
      expect(team_db.name_en).to match(event['en']['team1'])
    end
  end
end
