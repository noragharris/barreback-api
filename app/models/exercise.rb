# An Excercise is the core building block of a class
#
# Exercise Attributes
# - Name - String - Name given for Exercise by PBHQ
# - Active - Boolean - Exercise active for given quarter
# - Quarter - String - Quarter that Exercise was created
# - Year - Year - Year that Exercise was created
# - createdAt
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
# Name, class_type, section, location, direction, equipment, rotation, height

class Exercise < ApplicationRecord
  validates :name, presence: true
  validates :year, numericality: { only_integer: true }

  enum quarter: {
    Q1: 1,
    Q2: 2,
    Q3: 3,
    Q4: 4
  }

  enum class_type: {
    Classic: 1,
    Empower: 2,
    Reform: 3
  }
end
