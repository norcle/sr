# == Schema Information
#
# Table name: teams
#
#  id           :bigint           not null, primary key
#  bookmaker_id :bigint           not null
#  sport_id     :bigint           not null
#  external_id  :string
#  name_ru      :string           not null
#  name_en      :string           not null
#  slug         :string           not null
#  sex          :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  league_id    :bigint           not null
#
require 'rails_helper'

RSpec.describe Team, type: :model do
  describe 'methods' do
    before do
      @team = create(:team)
    end
    it 'name' do
      expect(@team.name).to match(@team.name_ru)
    end
  end
end
