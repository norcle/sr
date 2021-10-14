# == Schema Information
#
# Table name: factor_keys
#
#  id          :bigint           not null, primary key
#  name_en     :string(20)       not null
#  name_ru     :string(20)       not null
#  external_id :bigint           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require 'rails_helper'

RSpec.describe FactorKey, type: :model do
  describe 'methods' do
    before do
      @factor_key = FactorKey.find(1)
    end
    it 'parent' do
      expect(@factor_key.name).to match(@factor_key.name_ru)
    end
  end
end
