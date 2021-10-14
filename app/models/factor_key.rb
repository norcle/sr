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
class FactorKey < ApplicationRecord
  validates :name_ru, presence: true, uniqueness: false, length: { minimum: 1, maximum: 20 }
  validates :name_en, presence: true, uniqueness: false, length: { minimum: 1, maximum: 20 }
  validates :external_id, presence: true, uniqueness: false

  def name
    name_ru || name_en
  end
end
