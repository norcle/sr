require 'rails_helper'

RSpec.describe Parser::Fonbet::Event::Entity do
  let(:live_json) do
    @multilang = Struct.new(:ru, :en)
    @ru = JSON.parse(open('spec/fixtures/json/fonbet.json').read)
    @multilang.new(@ru, @ru)
  end
  let(:event) do
    { 'ru': live_json['ru']['events'].first, 'en': live_json['en']['events'].first }.with_indifferent_access
  end
  let(:entity) { described_class.new(event, live_json: live_json) }

  describe 'public' do
    it 'parse' do
      entity.parse
      event_db = Event.find_by(external_id: event['ru']['id'].to_s)
      expect(event_db).to be_truthy
    end
  end
end
