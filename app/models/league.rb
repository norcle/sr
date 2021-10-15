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
class League < ApplicationRecord
  belongs_to :sport
  belongs_to :bookmaker
  validates :name_ru, presence: true
  validates :name_en, presence: true
  validates :slug,    presence: true, uniqueness: true

  has_many :teams, dependent: :destroy
  has_many :events, dependent: :destroy

  def name
    name_ru || name_en
  end
end

Event.count