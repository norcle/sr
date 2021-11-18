require 'rails_helper'

RSpec.describe Parser::Fonbet::Event::Part do
  let(:live_json) do
    @multilang = Struct.new(:ru, :en)
    @ru = JSON.parse(open('spec/fixtures/json/fonbet.json').read)
    @multilang.new(@ru, @ru)
  end
  let(:part) { described_class.new(live_json) }
  let!(:events) { live_json.ru['events'].select { |x| x['level'] == 2 } }

  before do
    Parser::Fonbet::Event::Entity.clear_cache
    Parser::Fonbet::League.clear_cache
    Parser::Fonbet::Team.clear_cache
  end

  describe 'public' do
    it 'parse' do
      @league = create(:league, external_id: 71239)
      @team1 = create(:team, external_id: 377094)
      @team2 = create(:team, external_id: 400908)
      @event = create(:event, external_id: 30516658, team1: @team1, team2: @team2, league: @league)
      part.parse
      events.each do |event|
        event_db = Event.find_by(external_id: event['id'])
        expect(event_db.team1.external_id).to match(event['team1Id'].to_s)
        expect(event_db.team2.external_id).to match(event['team2Id'].to_s)
      end
      events.each do |event|
        event_db = Event.find_by(external_id: event['id'])
        expect(event_db.team1.external_id).to match(event['team1Id'].to_s)
        expect(event_db.team2.external_id).to match(event['team2Id'].to_s)
      end
    end
  end
end
