FactoryBot.define do
  factory :team do
    name_en { "team#{rand(100)}" }
    external_id { "team#{rand(100)}" }
    name_ru { "команда#{rand(100)}" }
    slug { "team#{rand(100)}" }
    association :sport, factory: :sport
    association :bookmaker, factory: :bookmaker
    sex { 0 }
  end
end
