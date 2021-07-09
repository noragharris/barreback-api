# frozen_string_literal: true

FactoryBot.define do
  factory :equipment_item do
    name { Faker::Name.equipment }
  end
end
