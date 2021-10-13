FactoryBot.define do
  factory :bookmaker do
    name_en { "book#{rand(1000)}" }
    name_ru { "бук#{rand(1000)}" }
    slug { "book#{rand(1000)}" }
    url {"https://bookmaker#{rand(1000)}"}
  end
end
