require 'rails_helper'

RSpec.describe Parser::Fonbet::Event::Part do
  let(:live_json) do
    @multilang = Struct.new(:ru, :en)
    @ru = JSON.parse(open('spec/fixtures/json/fonbet.json').read)
    @multilang.new(@ru, @ru)
  end
  let(:part) { described_class.new(live_json) }
  let!(:events) { live_json.ru['events'].select { |x| x['level'] == 2 } }

  describe 'public' do
    it 'parse' do
      @league = create(:league, external_id: 71239)
      @team1 = create(:team, external_id: 377094)
      @team2 = create(:team, external_id: 400908)
      @event = create(:event, external_id: 30516658, team1: @team1, team2: @team2, league: @league)
      part.parse
      events.each do |event|
        event_db = Event.find_by(external_id: event['id'])
        expect(event_db.parent_id.to_s).to match(@event.external_id)
        expect(event_db.level).to eq(2)
      end
    end

    it 'fail' do
      part.parse
      events.each do |event|
        event_db = Event.find_by(external_id: event['id'])
        expect(event_db).to be_truthy
        expect(Event.count).to eq(2)
        expect(Team.count).to  eq(0)
        expect(League.count).to eq(1)
      end
    end
  end
end
