class BarreClass < ApplicationRecord
  include ClassType

  has_many :barre_class_exercises
  has_many :exercises, through: :barre_class_exercises

  validates :location, presence: true
end
