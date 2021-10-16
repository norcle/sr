require 'rails_helper'

RSpec.describe Parser::Fonbet::Runner do
  describe 'init' do
    it 'create_event' do
      event = Generate::Event.new(live_mode: false, repeats: 10).generate
      expect(event).to match(Event.last)
      expect(event.factors.count).to match(130)
    end
  end
end
