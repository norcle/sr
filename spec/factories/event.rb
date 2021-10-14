FactoryBot.define do
  factory :event do
    slug { "event#{Random.rand(100)}" }
    level { 1 }
    parent_id { 1 }
    sport { Sport.find(1) }
    bookmaker { Bookmaker.find(1) }
    association :team1, factory: :team
    association :team2, factory: :team
    association :league, factory: :league
  end
end
