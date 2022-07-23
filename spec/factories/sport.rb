FactoryBot.define do
  factory :sport do
    name_en { "Sport#{Random.rand(100)}" }
    name_ru { "Sport#{Random.rand(100)}" }
    slug { "sport#{Random.rand(100)}" }
  end
end
