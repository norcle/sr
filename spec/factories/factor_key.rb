FactoryBot.define do
  factory :factor_key do
    name_en { "factor#{Random.rand(1000)}" }
    name_ru { "фактор#{Random.rand(1000)}" }
    external_id { Random.rand(10_000) }
  end
end
