FactoryBot.define do
  factory :team do
    name_en { "team#{Random.rand(100)}" }
    external_id { "team#{Random.rand(100)}" }
    name_ru { "команда#{Random.rand(100)}" }
    slug { "team#{Random.rand(100)}" }
    association :sport, factory: :sport
    association :bookmaker, factory: :bookmaker
    sex { 0 }
  end
end
