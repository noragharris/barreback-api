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
# Name, section, location, direction, equipment, rotation, height
#
# TODO attributes
# active, section, location, direction, equipment, height, pullOff, twoSided, setUp, choreography

class Exercise < ApplicationRecord
  include Quarter
  include ClassType

  enum rotation: {
    Turnout: 1,
    Parallel: 2
  }

  validates :name, presence: true
  validates :year, numericality: { only_integer: true }
  validates :rotation, inclusion: { in: rotations }
end
