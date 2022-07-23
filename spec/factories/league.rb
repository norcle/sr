FactoryBot.define do
  factory :league do
    name_en { "Sport#{Random.rand(100)}" }
    name_ru { "Sport#{Random.rand(100)}" }
    slug { "sport#{Random.rand(1_000_000)}" }
    sex { 0 }
    sport { Sport.find(1) }
    bookmaker { Bookmaker.find(1) }
    external_id { Random.rand(10_000_000) }
  end
end
