require 'rails_helper'

RSpec.describe Parser::Fonbet::Sport do
  let(:live_json) do
    @multilang = Struct.new(:ru, :en)
    @ru = JSON.parse(open('spec/fixtures/json/fonbet.json').read)
    @multilang.new(@ru, @ru)
  end
  let(:event) do
    { 'ru': live_json['ru']['events'].first, 'en': live_json['en']['events'].first }.with_indifferent_access
  end
  let(:sport) { described_class.new(sport_id: event['ru']['sportId'], live_json: live_json) }

  describe 'public' do
    it 'parse' do
      sport.parse
      sport_db = Sport.find_by(name_ru: 'Баскетбол')
      expect(sport_db).to be_truthy
      expect(sport_db.name_en).to match('Basketball')
    end
  end
end
