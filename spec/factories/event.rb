FactoryBot.define do
  factory :event do
    slug { "event#{Random.rand(100)}" }
    level { 1 }
    parent_id { 1 }
    association :sport, factory: :sport
    association :bookmaker, factory: :bookmaker
    association :team1, factory: :team
    association :team2, factory: :team
    association :league, factory: :league
  end
end
