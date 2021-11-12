require 'rails_helper'

RSpec.describe Parser::Fonbet::Factor::Collection do
  let(:live_json) do
    @multilang = Struct.new(:ru, :en)
    @ru = JSON.parse(open('spec/fixtures/json/fonbet.json').read)
    @multilang.new(@ru, @ru)
  end
  let(:event) { create(:event, external_id: live_json.ru['events'].first['id']) }
  let(:collection) { described_class.new([event], live_json: live_json) }

  describe 'public' do
    it 'parse' do
      collection.parse
      expect(Factor.count).to be > 0
    end
  end
end
