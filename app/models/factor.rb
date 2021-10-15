# == Schema Information
#
# Table name: factors
#
#  id            :bigint           not null, primary key
#  event_id      :bigint           not null
#  factor_key_id :bigint           not null
#  parameter     :integer
#  value         :decimal(7, 2)    not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Factor < ApplicationRecord
  validates :value, presence: true
  belongs_to :event
  belongs_to :factor_key
end
