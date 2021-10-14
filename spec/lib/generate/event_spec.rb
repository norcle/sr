require 'rails_helper'

RSpec.describe Generate::Event do
  describe 'init' do
    it 'init' do
      event = Generate::Event.new(sport: :basketball).generate
    end
  end
end
