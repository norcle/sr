FactoryBot.define do
  factory :league do
    name_en { "Sport#{Random.rand(100)}" }
    name_ru { "Sport#{Random.rand(100)}" }
    slug { "sport#{Random.rand(100)}" }
    sex { 0 }
    sport { Sport.find(1) }
    bookmaker { Bookmaker.find(1) }
  end
end
