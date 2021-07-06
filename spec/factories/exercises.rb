FactoryBot.define do
  factory :exercise do
    name { Faker::Name.thighs_turnout }
    quarter { Faker::Name.quarter }
    year { Faker::Number.between(from: 2010, to: Date.today.year) }
  end
end
