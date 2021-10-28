require 'rails_helper'

RSpec.describe Parser::Fonbet::Factor::Misc do
  let(:live_json) do
    @multilang = Struct.new(:ru, :en)
    @ru = JSON.parse(open('spec/fixtures/json/fonbet.json').read)
    @multilang.new(@ru, @ru)
  end
  let(:event_id) { @event_id ||= live_json.ru['events'].first['id'] }
  let(:event) { create(:event, external_id: event_id) }
  let(:misc) { described_class.new(event, live_json: live_json) }

  let(:event_miscs) { live_json['ru']['eventMiscs'].find {|m| m['id'] == event_id}}

  before do
    Parser::Fonbet::Event::Entity.clear_cache
    Parser::Fonbet::League.clear_cache
    Parser::Fonbet::Team.clear_cache
    Parser::Fonbet::Factor::Custom::Base.clear_cache
    Parser::Fonbet::Factor::Misc.clear_cache
  end

  describe 'public' do
    it 'parse' do
      misc.parse
      score1 = Factor.where(factor_key_id: 1, event: event).last
      score2 = Factor.where(factor_key_id: 2, event: event).last
      expect(score1).to be_truthy
      expect(score2).to be_truthy
      expect(score1.value.to_i).to match(event_miscs['score1'])
      expect(score2.value.to_i).to match(event_miscs['score2'])
    end
  end
end
