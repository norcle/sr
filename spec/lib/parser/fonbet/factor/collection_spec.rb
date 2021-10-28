require 'rails_helper'

RSpec.describe Parser::Fonbet::Factor::Collection do
  let(:live_json) do
    @multilang = Struct.new(:ru, :en)
    @ru = JSON.parse(open('spec/fixtures/json/fonbet.json').read)
    @multilang.new(@ru, @ru)
  end
  let(:event) { create(:event, external_id: live_json.ru['events'].first['id']) }
  let(:collection) { described_class.new([event], live_json: live_json) }

  before do
    Parser::Fonbet::Event::Entity.clear_cache
    Parser::Fonbet::League.clear_cache
    Parser::Fonbet::Team.clear_cache
    Parser::Fonbet::Factor::Custom::Base.clear_cache
    Parser::Fonbet::Factor::Misc.clear_cache
  end

  describe 'public' do
    it 'parse' do
      collection.parse
      expect(Factor.count).to be > 0
    end
  end
end
