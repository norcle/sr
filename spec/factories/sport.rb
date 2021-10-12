FactoryBot.define do
  factory :sport do
    name_en { "Sport#{rand(100)}" }
    name_ru { "Sport#{rand(100)}" }
    slug { "sport#{rand(100)}" }
  end
end
