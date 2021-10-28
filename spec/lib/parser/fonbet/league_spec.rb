require 'rails_helper'

RSpec.describe Parser::Fonbet::League do
  let(:live_json) do
    @multilang = Struct.new(:ru, :en)
    @ru = JSON.parse(open('spec/fixtures/json/fonbet.json').read)
    @multilang.new(@ru, @ru)
  end
  let(:event) do
    { 'ru': live_json['ru']['events'].first, 'en': live_json['en']['events'].first }.with_indifferent_access
  end
  let(:league_ru) { live_json.ru['sports'].find { |sport| sport['id'] == event['ru']['sportId'] } }
  let(:league_en) { live_json.ru['sports'].find { |sport| sport['id'] == event['en']['sportId'] } }
  let(:league) { described_class.new(sport_id: event['ru']['sportId'], live_json: live_json) }

  before do
    Parser::Fonbet::Event::Entity.clear_cache
    Parser::Fonbet::League.clear_cache
    Parser::Fonbet::Team.clear_cache
  end

  describe 'public' do
    it 'parse' do
      league.parse
      league_db = League.find_by(external_id: event['ru']['sportId'])
      expect(league_db).to be_truthy
      expect(league_db.name_ru).to match(league_ru['name'])
      expect(league_db.name_en).to match(league_en['name'])
    end
  end
end
