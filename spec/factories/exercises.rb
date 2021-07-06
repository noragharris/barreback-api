FactoryBot.define do
  factory :exercise do
    name { Faker::Name.thighs_turnout }
    quarter { Exercise.quarters.flatten.sample }
    year { Faker::Number.between(from: 2010, to: Date.today.year) }
  end
end
