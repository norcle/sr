# == Schema Information
#
# Table name: teams
#
#  id           :bigint           not null, primary key
#  bookmaker_id :bigint           not null
#  sport_id     :bigint           not null
#  name_ru      :string(20)       not null
#  name_en      :string(20)       not null
#  slug         :string(20)       not null
#  sex          :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Team < ApplicationRecord
  validates :name_ru, presence: true, uniqueness: true, length: { minimum: 3, maximum: 20 }
  validates :name_en, presence: true, uniqueness: true, length: { minimum: 3, maximum: 20 }
  validates :slug,    presence: true, uniqueness: true, length: { minimum: 3, maximum: 20 }

  belongs_to :bookmaker
  belongs_to :sport

  def name
    name_ru || name_en
  end
end
