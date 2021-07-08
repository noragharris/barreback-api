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
# - setUp - String - Set up instructions
# - choreography - String - full choreography of exercise
#
# TODO enums
# Name

class Exercise < ApplicationRecord
  include Quarter
  include ClassType

  has_and_belongs_to_many :equipment_items

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
    "Abs 1": 40,
    "Abs 2": 42,
    "Abs 3": 43,
    "Back Extension": 50,
    "Back Dancing": 60
  }

  enum location: {
    Center: 1,
    Barre: 2
  }

  enum direction: {
    "Barre": 10,
    "Right Profile": 12,
    "Left Profile": 13,
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
  validates :rotation, inclusion: { in: rotations }
  validates :section, inclusion: { in: sections }
  validates :location, inclusion: { in: locations }
  validates :direction, inclusion: { in: directions }
  validates :height, inclusion: { in: heights }
  validates :choreography, presence: true
end
