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
      total1 = Factor.find_by(factor_key_id: 16)
      expect(total1.value.to_f).to match(live_json.ru['customFactors'].find { |x| x['e'] == event_id && x['f'] == 930 }['v'])
      expect(total1.parameter).to match(live_json.ru['customFactors'].find { |x| x['e'] == event_id && x['f'] == 930 }['p'])
      total2 = Factor.find_by(factor_key_id: 17)
      if total2
        expect(total2.value.to_f).to match(live_json.ru['customFactors'].find { |x| x['e'] == event_id && x['f'] == 931 }['v'])
        expect(total2.parameter).to match(live_json.ru['customFactors'].find { |x| x['e'] == event_id && x['f'] == 931 }['p'])
      end
      total3 = Factor.find_by(factor_key_id: 18)
      if total3
        expect(total3.value.to_f).to match(live_json.ru['customFactors'].find { |x| x['e'] == event_id && x['f'] == 940 }['v'])
        expect(total3.parameter).to match(live_json.ru['customFactors'].find { |x| x['e'] == event_id && x['f'] == 940 }['p'])
      end
      total4 = Factor.find_by(factor_key_id: 19)
      if total4
        expect(total4.value.to_f).to match(live_json.ru['customFactors'].find { |x| x['e'] == event_id && x['f'] == 941 }['v'])
        expect(total4.parameter).to match(live_json.ru['customFactors'].find { |x| x['e'] == event_id && x['f'] == 941 }['p'])
      end
    end
  end
end
