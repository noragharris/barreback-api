FactoryBot.define do
  factory :barre_class do
    location { Faker::Address.city }
    class_type { BarreClass.class_types.flatten.sample }
  end
end
