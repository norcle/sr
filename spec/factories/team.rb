FactoryBot.define do
  factory :team do
    name_en { "team#{Random.rand(100)}" }
    name_ru { "команда#{Random.rand(100)}" }
    slug { "team#{Random.rand(1_000_000)}" }
    sport { Sport.find(1) }
    bookmaker { Bookmaker.find(1) }
    sex { 0 }
    association :league, factory: :league
    external_id { Random.rand(10_000_000) }
  end
end
