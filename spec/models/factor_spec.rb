# == Schema Information
#
# Table name: factors
#
#  id            :bigint           not null, primary key
#  event_id      :bigint           not null
#  factor_key_id :bigint           not null
#  parameter     :integer
#  value         :decimal(4, 2)    not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
require 'rails_helper'

RSpec.describe Factor, type: :model do
  describe 'methods' do
    before do
      @factor = create(:factor, factor_key: FactorKey.find(1))
    end
    it 'factor create' do
      expect(@factor.id).to be_truthy
    end
  end
end
