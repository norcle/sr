require 'rails_helper'

RSpec.describe Parser::Fonbet::Team do
  let(:live_json) do
    @multilang = Struct.new(:ru, :en)
    @ru = JSON.parse(open('spec/fixtures/json/fonbet.json').read)
    @multilang.new(@ru, @ru)
  end
  let(:event) do
    { 'ru': live_json['ru']['events'].first, 'en': live_json['en']['events'].first }.with_indifferent_access
  end
  let(:team_names) do
    {
      ru: event[:ru]["team1"],
      en: event[:en]["team1"]
    }
  end
  let(:team) { described_class.new(team_id: event['ru']['team1Id'], league: create(:league), team_names: team_names) }

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
