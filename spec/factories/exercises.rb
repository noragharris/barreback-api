# frozen_string_literal: true

FactoryBot.define do
  factory :exercise do
    name { Faker::Name.thighs_turnout }
    quarter { Exercise.quarters.flatten.sample }
    year { Faker::Number.between(from: 2010, to: Date.today.year) }
    class_type { Exercise.class_types.flatten.sample }
    rotation { Exercise.rotations.flatten.sample }
    section { Exercise.sections.flatten.sample }
    location { Exercise.locations.flatten.sample }
    direction { Exercise.directions.flatten.sample }
    height { Exercise.heights.flatten.sample }
    pull_off { Faker::Boolean.boolean }
    two_sided { Faker::Boolean.boolean }
    active { Faker::Boolean.boolean }
    choreography { Faker::Lorem.paragraphs.first }
  end
end
