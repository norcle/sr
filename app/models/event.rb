# == Schema Information
#
# Table name: events
#
#  id           :bigint           not null, primary key
#  external_id  :string
#  parent_id    :bigint           default(1), not null
#  bookmaker_id :bigint           not null
#  league_id    :bigint           not null
#  sport_id     :bigint           not null
#  level        :integer          default(1), not null
#  team1_id     :bigint
#  team2_id     :bigint
#  slug         :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Event < ApplicationRecord
  belongs_to :sport
  belongs_to :league
  belongs_to :bookmaker
  belongs_to :team1, foreign_key: 'team1_id', class_name: 'Team', optional: true
  belongs_to :team2, foreign_key: 'team2_id', class_name: 'Team', optional: true

  validates_presence_of :team1_id, :team2_id, if: proc { |f| f.level == 1 }


  has_many :factors, dependent: :destroy

  validates_uniqueness_of :slug, allow_blank: true

  validates :level, presence: true

  after_touch { p "Ooohh... You touch my talalal #{id}" }

  enum state: {
    not_started: 1,
    live: 2,
    ended: 3,
    cancelled: 4,
  }


  def parent
    Event.find(parent_id)
  end

  # state_machine :state, initial: :created do
  #   event :confirm_payment do
  #     transition created: :processing
  #   end
  #   event :pack do
  #     transition processing: :ready
  #   end
  #   event :cancel do
  #     transition %i[created processing ready] => :void
  #   end
  #   event :return do
  #     transition delivered: :void
  #   end
  #   event :ship do
  #     transition ready: :shipped
  #   end
  #   event :fail_delivery do
  #     transition shipped: :processing
  #   end
  # end

end
