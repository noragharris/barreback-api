FactoryBot.define do
  factory :barre_class do
    location { Faker::Address.city }
  end
end
