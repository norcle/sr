FactoryBot.define do
  factory :sport do
    name_en { Faker::Esport.game }
    name_ru { Faker::Esport.game }
    slug { Faker::Esport.game }
  end
end
