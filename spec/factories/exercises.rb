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
    set_up { Faker::Lorem.sentence(word_count: 6) }
    choreography do
      "Down 3up 1 –4x / 4 8s \n
      R arm up, sidebendL liftup –8x / 4 8s \n
      Hold sidebend, one pulse one pressback –8x / 4 8s \n
      Come center, switch arms, L arm up, sidebendR liftup –8x / 4 8s \n
      Hold sidebend, one pulse one pressback –8x / 4 8s \n
      Come center, option both arms up, down 3 up 1 –4x / 4 8s \n
      Pressback tempo –10xf"
    end
  end
end
