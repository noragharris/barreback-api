# frozen_string_literal: true

# An Excercise is the core building block of a class
#
# Exercise Attributes
# - Name - String - Name given for Exercise by PBHQ
# - Active - Boolean - Exercise active for given quarter
# - Quarter - String - Quarter that Exercise was created
# - Year - Year - Year that Exercise was created
# - classType - String - which type of Class an Exercise belongs to - Reform, Empower, Classic
# - section - String - which section of class the exercise belongs in
# - location - String - which location in the room the exercise is done in
# - direction - String - which direction the exercise faces
# - equipment - Array[String] - equipment necessary for the exercise
# - rotation - String - if the exercise is turnout or parallel
# - height - String - which height the exercise is done at
# - pullOff - Boolean - whether the exercise is considered pulling off of the barre
# - twoSided - Boolean - whether the exercise is done on 2 sides (mostly for Thighs)
# - choreography - String - full choreography of exercise
#
# TODO enums
# Name

class Exercise < ApplicationRecord
  include Quarter
  include ClassType

  has_and_belongs_to_many :equipment_items
  has_many :barre_class_exercises
  has_many :barre_classes, through: :barre_class_exercises

  before_create { self.pull_off = pull_off }
  before_create { self.two_sided = two_sided }
  before_create { self.active = active }

  enum rotation: {
    Turnout: 1,
    Parallel: 2
  }

  enum section: {
    "Warm Up": 10,
    "Weight Work": 15,
    "Thighs": 20,
    "Seat": 30,
    "Core Focus": 40,
    "Abs 1": 50,
    "Abs 2": 52,
    "Abs 3": 53,
    "Back Extension": 60,
    "Back Dancing": 70
  }

  enum location: {
    Center: 1,
    Barre: 2
  }

  enum direction: {
    "Barre": 10,
    "Right Profile": 12,
    "Left Profile": 13,
    "Profile": 14,
    "Center": 15,
    "Front": 20
  }, _prefix: :direction

  enum height: {
    Standing: 10,
    Mid: 20,
    Floor: 30
  }

  validates :name, presence: true
  validates :year, numericality: { only_integer: true }
  validates :rotation, inclusion: { in: rotations }, unless: -> { rotation.blank? }
  validates :section, inclusion: { in: sections }
  validates :location, inclusion: { in: locations }, unless: -> { location.blank? }
  validates :direction, inclusion: { in: directions }, unless: -> { direction.blank? }
  validates :height, inclusion: { in: heights }, unless: -> { height.blank? }
  validates :choreography, presence: true

  scope :filter_by_section, ->(section) { where section: section }
  scope :filter_by_rotation, ->(rotation) { where rotation: rotation }
  scope :filter_by_class_type, ->(class_type) { where class_type: class_type }
  # TODO FILTER BY EQUIPMENT
end
