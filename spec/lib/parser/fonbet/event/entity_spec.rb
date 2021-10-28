require 'rails_helper'

RSpec.describe Parser::Fonbet::Event::Entity do
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
  let(:league_ru) { live_json.ru['sports'].find { |sport| sport['id'] == event['ru']['sportId'] } }
  let(:league_en) { live_json.ru['sports'].find { |sport| sport['id'] == event['en']['sportId'] } }
  let(:entity) { described_class.new(event, live_json: live_json) }

  before do
    Parser::Fonbet::Event::Entity.clear_cache
    Parser::Fonbet::League.clear_cache
    Parser::Fonbet::Team.clear_cache
  end

  describe 'public' do
    it 'parse' do
      described_class.clear_cache
      entity.parse
      event_db = Event.find_by(external_id: event['ru']['id'].to_s)
      expect(event_db).to be_truthy
      expect(event_db.team1.name_ru).to match(event['ru']['team1'])
      expect(event_db.team2.name_ru).to match(event['ru']['team2'])
      expect(event_db.team1.name_en).to match(event['en']['team1'])
      expect(event_db.team2.name_en).to match(event['en']['team2'])
      expect(event_db.team1.external_id).to match(event['ru']['team1Id'].to_s)
      expect(event_db.team2.external_id).to match(event['ru']['team2Id'].to_s)
      expect(event_db.league.name_ru).to match(league_ru['name'])
      expect(event_db.league.name_en).to match(league_ru['name'])
      expect(event_db.league.external_id).to match(league_ru['id'])
    end
  end
end
