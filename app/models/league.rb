# == Schema Information
#
# Table name: leagues
#
#  id           :bigint           not null, primary key
#  name_en      :string(15)       not null
#  name_ru      :string(15)       not null
#  sex          :integer
#  slug         :string(15)       not null
#  sport_id     :bigint           not null
#  bookmaker_id :bigint           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class League < ApplicationRecord
  belongs_to :sport
  belongs_to :bookmaker
  validates :name_ru, presence: true, uniqueness: true, length: { minimum: 3, maximum: 15 }
  validates :name_en, presence: true, uniqueness: true, length: { minimum: 3, maximum: 15 }
  validates :slug,    presence: true, uniqueness: true, length: { minimum: 3, maximum: 15 }

  def name
    name_ru || name_en
  end
end
