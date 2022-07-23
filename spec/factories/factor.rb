FactoryBot.define do
  factory :factor do
    value { Random.rand(100) }
    parameter { Random.rand(1000) }
    association :factor_key, factory: :factor_key
    association :event, factory: :event
  end
end
