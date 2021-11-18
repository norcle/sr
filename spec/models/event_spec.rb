# == Schema Information
#
# Table name: events
#
#  id           :bigint           not null, primary key
#  external_id  :string
#  parent_id    :bigint           default(1), not null
#  bookmaker_id :bigint           not null
#  league_id    :bigint           not null
#  sport_id     :bigint           not null
#  level        :integer          default(1), not null
#  team1_id     :bigint
#  team2_id     :bigint
#  slug         :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
require 'rails_helper'

RSpec.describe Event, type: :model do
  describe 'methods' do
    before do
      @event = create(:event)
    end
    it 'parent' do
      expect(@event.parent_id).to match(1)
    end
  end
  describe "Team can be nil" do
    it 'nil' do
      @event = create(:event, level: 2, team1: nil, team2: nil)
      expect(@event).to be_truthy
    end
    it 'error' do
      expect {  create(:event, level: 1, team1: nil, team2: nil) }.to raise_error
    end
  end
end
