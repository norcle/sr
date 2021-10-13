# == Schema Information
#
# Table name: bookmakers
#
#  id         :bigint           not null, primary key
#  name_en    :string(10)       not null
#  name_ru    :string(10)       not null
#  slug       :string(10)       not null
#  url        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Bookmaker, type: :model do
  describe 'methods' do
    before do
      @bookmaker = create(:bookmaker)
    end
    it 'name' do
      expect(@bookmaker.name).to match(@bookmaker.name_ru)
    end
  end
end
