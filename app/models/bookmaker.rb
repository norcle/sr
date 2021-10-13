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
class Bookmaker < ApplicationRecord
  validates :name_ru, presence: true, uniqueness: true, length: { minimum: 3, maximum: 10 }
  validates :name_en, presence: true, uniqueness: true, length: { minimum: 3, maximum: 10 }
  validates :slug,    presence: true, uniqueness: true, length: { minimum: 3, maximum: 10 }

  def name
    name_ru || name_en
  end
end
