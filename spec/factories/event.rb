FactoryBot.define do
  factory :event do
    slug { "event#{Random.rand(1_000_000)}" }
    level { 1 }
    parent_id { 1 }
    sport { Sport.find(1) }
    external_id { Random.rand(10_000_000) }
    bookmaker { Bookmaker.find(1) }
    association :team1, factory: :team
    association :team2, factory: :team
    association :league, factory: :league
  end
end
