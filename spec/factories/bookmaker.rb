FactoryBot.define do
  factory :bookmaker do
    name_en { "book#{Random.rand(1000)}" }
    name_ru { "бук#{Random.rand(1000)}" }
    slug { "book#{Random.rand(1000)}" }
    url {"https://bookmaker#{Random.rand(1000)}"}
  end
end
