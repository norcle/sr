require 'rails_helper'

RSpec.describe Parser::Fonbet::Factor::Custom::Win do
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
      win1 = Factor.find_by(factor_key_id: 10)
      winx = Factor.find_by(factor_key_id: 11)
      win2 = Factor.find_by(factor_key_id: 12)
      onex = Factor.find_by(factor_key_id: 13)
      xtwo = Factor.find_by(factor_key_id: 15)
      onetwo = Factor.find_by(factor_key_id: 14)
      expect(win1.value.to_f).to match(live_json.ru['customFactors'].find { |x| x['e'] == event_id && x['f'] == 921 }['v'])
      expect(winx.value.to_f).to match(live_json.ru['customFactors'].find { |x| x['e'] == event_id && x['f'] == 922 }['v'])
      expect(win2.value.to_f).to match(live_json.ru['customFactors'].find { |x| x['e'] == event_id && x['f'] == 923 }['v'])
      expect(onex.value.to_f).to match(live_json.ru['customFactors'].find { |x| x['e'] == event_id && x['f'] == 924 }['v'])
      expect(xtwo.value.to_f).to match(live_json.ru['customFactors'].find { |x| x['e'] == event_id && x['f'] == 926 }['v'])
      expect(onetwo.value.to_f).to match(live_json.ru['customFactors'].find { |x| x['e'] == event_id && x['f'] == 925 }['v'])
    end
  end
end
