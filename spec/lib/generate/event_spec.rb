require 'rails_helper'

RSpec.describe Generate::Event do
  describe 'init' do
    it 'create_event' do
      event = Generate::Event.new(live_mode: false, repeats: 10).generate
      expect(event).to match(Event.last)
      expect(event.factors.count).to match(130)
    end
  end
end
