# == Schema Information
#
# Table name: leagues
#
#  id           :bigint           not null, primary key
#  name_en      :string           not null
#  name_ru      :string           not null
#  sex          :integer
#  slug         :string           not null
#  sport_id     :bigint           not null
#  bookmaker_id :bigint           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  external_id  :bigint
#
require 'rails_helper'

RSpec.describe League, type: :model do
  describe 'methods' do
    before do
      @league = create(:league)
    end
    it 'name' do
      expect(@league.name).to match(@league.name_ru)
    end
  end
end
