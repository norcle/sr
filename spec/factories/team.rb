FactoryBot.define do
  factory :team do
    name_en { "team#{Random.rand(100)}" }
    external_id { "team#{Random.rand(100)}" }
    name_ru { "команда#{Random.rand(100)}" }
    slug { "team#{Random.rand(100)}" }
    sport { Sport.find(1) }
    bookmaker { Bookmaker.find(1) }
    sex { 0 }
  end
end
