require 'rails_helper'

RSpec.describe Parser::Fonbet::Factor::Custom::Total do
  let(:live_json) do
    @multilang = Struct.new(:ru, :en)
    @ru = JSON.parse(open('spec/fixtures/json/fonbet.json').read)
    @multilang.new(@ru, @ru)
  end
  let(:event_id) { @event_id ||= live_json.ru['events'].first['id'] }
  let(:event) { create(:event, external_id: event_id) }
  let(:win) { described_class.new(event, live_json: live_json.ru['customFactors']) }

  before do
    Parser::Fonbet::Event::Entity.clear_cache
    Parser::Fonbet::League.clear_cache
    Parser::Fonbet::Team.clear_cache
    Parser::Fonbet::Factor::Custom::Base.clear_cache
    Parser::Fonbet::Factor::Misc.clear_cache
  end

  describe 'public' do
    it 'parse' do
      win.parse
      total = Factor.find_by(factor_key_id: 16)
      expect(total.value.to_f).to match(live_json.ru['customFactors'].find { |x| x['e'] == event_id && x['f'] == 930 }['v'])
      expect(total.parameter).to match(live_json.ru['customFactors'].find { |x| x['e'] == event_id && x['f'] == 930 }['p'])
    end
  end
end
