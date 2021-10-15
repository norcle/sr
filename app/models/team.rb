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
class Team < ApplicationRecord
  validates :name_ru, presence: true
  validates :name_en, presence: true
  validates :slug,    presence: true, uniqueness: true
  validates :external_id, presence: false, uniqueness: true

  belongs_to :bookmaker
  belongs_to :sport
  belongs_to :league

  def name
    name_ru || name_en
  end
end
