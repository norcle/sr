FactoryBot.define do
  factory :league do
    name_en { "Sport#{rand(100)}" }
    name_ru { "Sport#{rand(100)}" }
    slug { "sport#{rand(100)}" }
    sex { 0 }
    association :sport, factory: :sport
    association :bookmaker, factory: :bookmaker
  end
end
