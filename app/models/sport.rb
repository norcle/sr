# == Schema Information
#
# Table name: sports
#
#  id         :bigint           not null, primary key
#  name_ru    :string(20)       not null
#  name_en    :string(15)       not null
#  slug       :string(15)       not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Sport < ApplicationRecord
  validates :name_ru, presence: true, uniqueness: true, length: { minimum: 1, maximum: 20 }
  validates :name_en, presence: true, uniqueness: true, length: { minimum: 1, maximum: 15 }
  validates :slug,    presence: true, uniqueness: true, length: { minimum: 1, maximum: 15 }
end
