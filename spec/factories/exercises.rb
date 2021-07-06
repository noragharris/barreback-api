FactoryBot.define do
  factory :exercise do
    name { Faker::Name.thighs_turnout }
    quarter { Exercise.quarters.flatten.sample }
    year { Faker::Number.between(from: 2010, to: Date.today.year) }
    class_type { Exercise.class_types.flatten.sample }
    rotation { Exercise.rotations.flatten.sample }
  end
end
