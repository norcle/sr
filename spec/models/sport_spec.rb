# == Schema Information
#
# Table name: sports
#
#  id         :bigint           not null, primary key
#  name_ru    :string(20)       not null
#  name_en    :string(15)       not null
#  slug       :string(15)       not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Sport, type: :model do
  describe 'methods' do
    before do
      @sport = Sport.find(1)
    end
    it 'name' do
      expect(@sport.name).to match(@sport.name_ru)
    end
  end
end
