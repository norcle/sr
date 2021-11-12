require 'rails_helper'

RSpec.describe Parser::Fonbet::Factor::Custom::Fora do
  let(:live_json) do
    @multilang = Struct.new(:ru, :en)
    @ru = JSON.parse(open('spec/fixtures/json/fonbet.json').read)
    @multilang.new(@ru, @ru)
  end
  let(:event_id) { @event_id ||= live_json.ru['events'].first['id'] }
  let(:event) { create(:event, external_id: event_id) }
  let(:fora) { described_class.new(event, live_json: live_json.ru['customFactors']) }

  describe 'public' do
    it 'parse' do
      fora.parse
      fora1 = Factor.find_by(factor_key_id: 20)
      fora2 = Factor.find_by(factor_key_id: 21)
      expect(fora1.value.to_f).to match(live_json.ru['customFactors'].find { |x| x['e'] == event_id && x['f'] == 927 }['v'])
      expect(fora1.parameter).to match(live_json.ru['customFactors'].find { |x| x['e'] == event_id && x['f'] == 927 }['p'])
      expect(fora2.value.to_f).to match(live_json.ru['customFactors'].find { |x| x['e'] == event_id && x['f'] == 928 }['v'])
      expect(fora2.parameter).to match(live_json.ru['customFactors'].find { |x| x['e'] == event_id && x['f'] == 928 }['p'])
    end
  end
end
