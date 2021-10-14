require 'rails_helper'

RSpec.describe Generate::Event do
  describe 'init' do
    it 'create_event' do
      event = Generate::Event.new.generate
      expect(event).to match(Event.last)
    end
  end
end
