# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

## All exercises based on 2021 Q3 Pure Barre - No choreography copied

puts 'Seeding.......'

# ---------------------------------------------
# Equipment Items
# ---------------------------------------------

EQUIPMENT_ITEM_NAMES = ['Ball', 'Double Tube', 'Weights', 'One Weight', 'Sliders', 'One Slider', 'Bottom Tubes',
                        'Right Bottom Tube', 'Left Bottom Tube', 'Top Tubes', 'Right Top Tube', 'Left Top Tube', 'Platform', 'Mat', 'Wrist Weights', 'Ankle Weights'].freeze

puts ".....Seeding #{EQUIPMENT_ITEM_NAMES.length} Equipment Items"
EQUIPMENT_ITEM_NAMES.each do |eq|
  EquipmentItem.create!(name: eq)
end

BALL_ID = EquipmentItem.find_by(name: 'Ball').id
DOUBLE_TUBE_ID = EquipmentItem.find_by(name: 'Double Tube').id
WEIGHTS_ID = EquipmentItem.find_by(name: 'Weights').id
MAT = EquipmentItem.find_by(name: 'Mat').id

Q3_QUARTER = 'Q3'
YEAR_2021 = 2021

# Class Types
CLASSIC = 'Classic'

# Class Sections
WARM_UP = 'Warm Up'
WEIGHT_WORK = 'Weight Work'
THIGHS = 'Thighs'
SEAT = 'Seat'
CORE_FOCUS = 'Core Focus'
ABS1 = 'Abs 1'
ABS2 = 'Abs 2'
ABS3 = 'Abs 3'
BACK_EXTENSION = 'Back Extension'
BACK_DANCING = 'Back Dancing'

# Directions
FRONT = 'Front'
PROFILE = 'Profile'
R_PROFILE = 'Right Profile'
L_PROFILE = 'Left Profile'

# Locations / Directions
BARRE = 'Barre'
CENTER = 'Center'

# Rotations
TURNOUT = 'Turnout'
PARALLEL = 'Parallel'

# Heights
STANDING = 'Standing'
MID = 'Mid'
FLOOR = 'Floor'

REPEATED_ACROSS_EXERCISES = {
  active: true,
  quarter: Q3_QUARTER,
  year: YEAR_2021,
  class_type: CLASSIC,
  choreography: Faker::Lorem.paragraphs
}.freeze

# ---------------------------------------------
# Exercise Warm Ups
# ---------------------------------------------
REPEATED_WARM_UP = {
  section: WARM_UP,
  location: CENTER,
  direction: FRONT
}.freeze

WARM_UP_A = { name: 'Warm Up A' }.merge(REPEATED_WARM_UP, REPEATED_ACROSS_EXERCISES)
WARM_UP_B = { name: 'Warm Up B', equipment_item_ids: [BALL_ID] }.merge(REPEATED_WARM_UP, REPEATED_ACROSS_EXERCISES)
WARM_UP_C = { name: 'Warm Up C', equipment_item_ids: [DOUBLE_TUBE_ID] }.merge(REPEATED_WARM_UP,
                                                                              REPEATED_ACROSS_EXERCISES)

WARM_UPS = [WARM_UP_A, WARM_UP_B, WARM_UP_C].freeze

puts ".....Seeding #{WARM_UPS.length} Warm Ups"
WARM_UPS.each do |wu|
  Exercise.create!(wu)
end

# ---------------------------------------------
# Exercise Weight Works
# ---------------------------------------------
REPEATED_WEIGHT_WORK = {
  section: WEIGHT_WORK,
  location: CENTER,
  direction: FRONT
}.freeze

WEIGHT_WORK_A = { name: 'Weight Work A', equipment_item_ids: [WEIGHTS_ID] }.merge(REPEATED_WEIGHT_WORK,
                                                                                  REPEATED_ACROSS_EXERCISES)
WEIGHT_WORK_B = { name: 'Weight Work B', equipment_item_ids: [WEIGHTS_ID] }.merge(REPEATED_WEIGHT_WORK,
                                                                                  REPEATED_ACROSS_EXERCISES)
WEIGHT_WORK_C = { name: 'Weight Work C', equipment_item_ids: [WEIGHTS_ID, DOUBLE_TUBE_ID] }.merge(REPEATED_WEIGHT_WORK,
                                                                                                  REPEATED_ACROSS_EXERCISES)

WEIGHT_WORKS = [WEIGHT_WORK_A, WEIGHT_WORK_B, WEIGHT_WORK_C].freeze

puts ".....Seeding #{WEIGHT_WORKS.length} Weight Works"
WEIGHT_WORKS.each do |ww|
  Exercise.create!(ww)
end

# ---------------------------------------------
# Exercise Thighs Turnout
# ---------------------------------------------
REPEATED_THIGH_TURNOUT = {
  section: THIGHS,
  rotation: TURNOUT
}.freeze

LOW_V = {
  name: 'Low V',
  location: BARRE,
  direction: CENTER
}.merge(REPEATED_THIGH_TURNOUT, REPEATED_ACROSS_EXERCISES)

HIGH_V = {
  name: 'High V',
  location: BARRE,
  direction: PROFILE,
  equipment_item_ids: [BALL_ID]
}.merge(REPEATED_THIGH_TURNOUT, REPEATED_ACROSS_EXERCISES)

WIDE_2nd = {
  name: 'Wide 2nd',
  location: BARRE,
  direction: BARRE
}.merge(REPEATED_THIGH_TURNOUT, REPEATED_ACROSS_EXERCISES)

EXTENSION_TURNOUT = {
  name: 'Extension Turnout',
  location: BARRE,
  direction: CENTER,
  two_sided: true
}.merge(REPEATED_THIGH_TURNOUT, REPEATED_ACROSS_EXERCISES)

CHAIR_HIGH_V = {
  name: 'Chair High V',
  location: BARRE,
  direction: BARRE,
  pull_off: true
}.merge(REPEATED_THIGH_TURNOUT, REPEATED_ACROSS_EXERCISES)

WATERSKI_V = {
  name: 'Waterski V',
  location: BARRE,
  direction: BARRE,
  equipment_item_ids: [BALL_ID],
  pull_off: true
}.merge(REPEATED_THIGH_TURNOUT, REPEATED_ACROSS_EXERCISES)

WATERSKI_WIDE_2nd = {
  name: 'Waterski Wide 2nd',
  location: BARRE,
  direction: BARRE,
  pull_off: true
}.merge(REPEATED_THIGH_TURNOUT, REPEATED_ACROSS_EXERCISES)

WIDE_2nd_FOLDOVER = {
  name: 'Wide 2nd Foldover',
  location: BARRE,
  direction: BARRE
}.merge(REPEATED_THIGH_TURNOUT, REPEATED_ACROSS_EXERCISES)

FOURTH = {
  name: 'Fourth',
  location: BARRE,
  direction: CENTER,
  two_sided: true
}.merge(REPEATED_THIGH_TURNOUT, REPEATED_ACROSS_EXERCISES)

LOW_V_DT = {
  name: 'Low V w/ Double Tube',
  location: BARRE,
  direction: PROFILE,
  equipment_item_ids: [DOUBLE_TUBE_ID]
}.merge(REPEATED_THIGH_TURNOUT, REPEATED_ACROSS_EXERCISES)

HIGH_V_DT = {
  name: 'High V w/ Double Tube',
  location: BARRE,
  direction: PROFILE,
  equipment_item_ids: [DOUBLE_TUBE_ID]
}.merge(REPEATED_THIGH_TURNOUT, REPEATED_ACROSS_EXERCISES)

WIDE_2nd_DT = {
  name: 'Wide 2nd w/ Double Tube',
  location: CENTER,
  direction: FRONT,
  equipment_item_ids: [DOUBLE_TUBE_ID]
}.merge(REPEATED_THIGH_TURNOUT, REPEATED_ACROSS_EXERCISES)

EXTENSION_TURNOUT_DT = {
  name: 'Extension Turnout w/ Double Tube',
  location: BARRE,
  direction: R_PROFILE,
  equipment_item_ids: [DOUBLE_TUBE_ID],
  two_sided: true
}.merge(REPEATED_THIGH_TURNOUT, REPEATED_ACROSS_EXERCISES)

CHAIR_HIGH_V_DT = {
  name: 'Chair High V w/ Double Tube',
  location: BARRE,
  direction: BARRE,
  equipment_item_ids: [DOUBLE_TUBE_ID],
  pull_off: true
}.merge(REPEATED_THIGH_TURNOUT, REPEATED_ACROSS_EXERCISES)

WATERSKI_V_DT = {
  name: 'Waterski V w/ Double Tube',
  location: BARRE,
  direction: BARRE,
  equipment_item_ids: [DOUBLE_TUBE_ID],
  pull_off: true
}.merge(REPEATED_THIGH_TURNOUT, REPEATED_ACROSS_EXERCISES)

WATERSKI_WIDE_2nd_DT = {
  name: 'Waterski Wide 2nd w/ Double Tube',
  location: BARRE,
  direction: BARRE,
  equipment_item_ids: [DOUBLE_TUBE_ID],
  pull_off: true
}.merge(REPEATED_THIGH_TURNOUT, REPEATED_ACROSS_EXERCISES)

WIDE_2nd_FOLDOVER_DT = {
  name: 'Wide 2nd Foldover w/ Double Tube',
  location: BARRE,
  direction: BARRE,
  equipment_item_ids: [DOUBLE_TUBE_ID]
}.merge(REPEATED_THIGH_TURNOUT, REPEATED_ACROSS_EXERCISES)

FOURTH_DT = {
  name: 'Fourth w/ Double Tube',
  location: BARRE,
  direction: R_PROFILE,
  equipment_item_ids: [DOUBLE_TUBE_ID],
  two_sided: true
}.merge(REPEATED_THIGH_TURNOUT, REPEATED_ACROSS_EXERCISES)

LYING_ON_BACK_DT = {
  name: 'Lying on Back',
  location: BARRE,
  direction: R_PROFILE,
  equipment_item_ids: [DOUBLE_TUBE_ID],
  two_sided: true
}.merge(REPEATED_THIGH_TURNOUT, REPEATED_ACROSS_EXERCISES)

THIGHS_TURNOUT = [
  LOW_V,
  HIGH_V,
  WIDE_2nd,
  EXTENSION_TURNOUT,
  CHAIR_HIGH_V,
  WATERSKI_V,
  WATERSKI_WIDE_2nd,
  WIDE_2nd_FOLDOVER,
  FOURTH,
  LOW_V_DT,
  HIGH_V_DT,
  WIDE_2nd_DT,
  EXTENSION_TURNOUT_DT,
  CHAIR_HIGH_V_DT,
  WATERSKI_V_DT,
  WATERSKI_WIDE_2nd_DT,
  WIDE_2nd_FOLDOVER_DT,
  FOURTH_DT,
  LYING_ON_BACK_DT
].freeze

puts ".....Seeding #{THIGHS_TURNOUT.length} turnout Thighs"
THIGHS_TURNOUT.each do |tt|
  Exercise.create!(tt)
end

# ---------------------------------------------
# Exercise Thighs Parallel
# ---------------------------------------------

REPEATED_THIGH_PARALLEL = {
  section: THIGHS,
  rotation: PARALLEL
}.freeze

PARALLEL_HIP_WIDTH = {
  name: 'Parallel Hip Width',
  location: BARRE,
  direction: PROFILE,
  two_sided: true
}.merge(REPEATED_THIGH_PARALLEL, REPEATED_ACROSS_EXERCISES)

PARALLEL_TOGETHER = {
  name: 'Parallel Together',
  location: BARRE,
  direction: BARRE,
  equipment_item_ids: [BALL_ID]
}.merge(REPEATED_THIGH_PARALLEL, REPEATED_ACROSS_EXERCISES)

EXTENSION_PARALLEL = {
  name: 'Extension Parallel',
  location: BARRE,
  direction: R_PROFILE,
  two_sided: true
}.merge(REPEATED_THIGH_PARALLEL, REPEATED_ACROSS_EXERCISES)

CHAIR_PARALLEL_HIP_WIDTH = {
  name: 'Chair Parallel Hip Width',
  location: BARRE,
  direction: BARRE,
  pull_off: true
}.merge(REPEATED_THIGH_PARALLEL, REPEATED_ACROSS_EXERCISES)

CHAIR_PARALLEL_TOGETHER = {
  name: 'Chair Parallel Together',
  location: BARRE,
  direction: BARRE,
  pull_off: true
}.merge(REPEATED_THIGH_PARALLEL, REPEATED_ACROSS_EXERCISES)

KNOCK_KNEED = {
  name: 'Knock Kneed',
  location: BARRE,
  direction: PROFILE
}.merge(REPEATED_THIGH_PARALLEL, REPEATED_ACROSS_EXERCISES)

WATERSKI_HIP_WIDTH = {
  name: 'Waterski Hip Width',
  location: BARRE,
  direction: BARRE,
  pull_off: true
}.merge(REPEATED_THIGH_PARALLEL, REPEATED_ACROSS_EXERCISES)

REVERSE_CHAIR = {
  name: 'Reverse Chair',
  location: BARRE,
  direction: CENTER,
  equipment_item_ids: [BALL_ID]
}.merge(REPEATED_THIGH_PARALLEL, REPEATED_ACROSS_EXERCISES)

KNEELING_THIGH = {
  name: 'Kneeling',
  location: BARRE,
  direction: CENTER
}.merge(REPEATED_THIGH_PARALLEL, REPEATED_ACROSS_EXERCISES)

PARALLEL_HIP_WIDTH_DT = {
  name: 'Parallel Hip Width w/ Double Tube',
  location: BARRE,
  direction: CENTER,
  equipment_item_ids: [DOUBLE_TUBE_ID]
}.merge(REPEATED_THIGH_PARALLEL, REPEATED_ACROSS_EXERCISES)

PARALLEL_TOGETHER_DT = {
  name: 'Parallel Together w/ Double Tube',
  location: BARRE,
  direction: BARRE,
  equipment_item_ids: [DOUBLE_TUBE_ID]
}.merge(REPEATED_THIGH_PARALLEL, REPEATED_ACROSS_EXERCISES)

EXTENSION_PARALLEL_DT = {
  name: 'Extension Parallel w/ Double Tube',
  location: BARRE,
  direction: R_PROFILE,
  equipment_item_ids: [DOUBLE_TUBE_ID],
  two_sided: true
}.merge(REPEATED_THIGH_PARALLEL, REPEATED_ACROSS_EXERCISES)

CHAIR_PARALLEL_HIP_WIDTH_DT = {
  name: 'Chair Parallel Hip Width w/ Double Tube',
  location: BARRE,
  direction: BARRE,
  equipment_item_ids: [DOUBLE_TUBE_ID],
  pull_off: true
}.merge(REPEATED_THIGH_PARALLEL, REPEATED_ACROSS_EXERCISES)

CHAIR_PARALLEL_TOGETHER_DT = {
  name: 'Chair Parallel Together w/ Double Tube',
  location: BARRE,
  direction: BARRE,
  equipment_item_ids: [DOUBLE_TUBE_ID],
  pull_off: true
}.merge(REPEATED_THIGH_PARALLEL, REPEATED_ACROSS_EXERCISES)

KNOCK_KNEED_DT = {
  name: 'Knock Kneed w/ Double Tube',
  location: BARRE,
  direction: BARRE,
  equipment_item_ids: [DOUBLE_TUBE_ID]
}.merge(REPEATED_THIGH_PARALLEL, REPEATED_ACROSS_EXERCISES)

WATERSKI_HIP_WIDTH_DT = {
  name: 'Waterski Hip Width w/ Double Tube',
  location: BARRE,
  direction: BARRE,
  equipment_item_ids: [DOUBLE_TUBE_ID],
  pull_off: true
}.merge(REPEATED_THIGH_PARALLEL, REPEATED_ACROSS_EXERCISES)

LOW_EXTENSION = {
  name: 'Low Extension',
  location: BARRE,
  direction: CENTER,
  equipment_item_ids: [DOUBLE_TUBE_ID],
  two_sided: true
}.merge(REPEATED_THIGH_PARALLEL, REPEATED_ACROSS_EXERCISES)

REVERSE_CHAIR_DT = {
  name: 'Reverse Chair w/ Double Tube',
  location: BARRE,
  direction: CENTER,
  equipment_item_ids: [DOUBLE_TUBE_ID]
}.merge(REPEATED_THIGH_PARALLEL, REPEATED_ACROSS_EXERCISES)

KNEELING_THIGH_DT = {
  name: 'Kneeling w/ Double Tube',
  location: BARRE,
  direction: BARRE,
  equipment_item_ids: [DOUBLE_TUBE_ID]
}.merge(REPEATED_THIGH_PARALLEL, REPEATED_ACROSS_EXERCISES)

THIGHS_PARALLEl = [
  PARALLEL_HIP_WIDTH,
  PARALLEL_TOGETHER,
  EXTENSION_PARALLEL,
  CHAIR_PARALLEL_HIP_WIDTH,
  CHAIR_PARALLEL_TOGETHER,
  KNOCK_KNEED,
  WATERSKI_HIP_WIDTH,
  REVERSE_CHAIR,
  KNEELING_THIGH,
  PARALLEL_HIP_WIDTH_DT,
  PARALLEL_TOGETHER_DT,
  EXTENSION_PARALLEL_DT,
  CHAIR_PARALLEL_HIP_WIDTH_DT,
  CHAIR_PARALLEL_TOGETHER_DT,
  KNOCK_KNEED_DT,
  WATERSKI_HIP_WIDTH_DT,
  LOW_EXTENSION,
  REVERSE_CHAIR_DT,
  KNEELING_THIGH_DT
].freeze

puts ".....Seeding #{THIGHS_PARALLEl.length} parallel Thighs"
THIGHS_PARALLEl.each do |pt|
  Exercise.create!(pt)
end

# ---------------------------------------------
# Exercise Seat Turnout
# ---------------------------------------------

REPEATED_SEAT_TURNOUT = {
  section: SEAT,
  rotation: TURNOUT
}.freeze

STANDING_STRAIGHT_LEG = {
  name: 'Standing Straight Leg',
  location: BARRE,
  direction: CENTER,
  height: STANDING
}.merge(REPEATED_SEAT_TURNOUT, REPEATED_ACROSS_EXERCISES)

SEMI_FOLDOVER_TURNOUT = {
  name: 'Semi Foldover Turnout',
  location: BARRE,
  direction: BARRE,
  equipment_item_ids: [BALL_ID],
  height: MID
}.merge(REPEATED_SEAT_TURNOUT, REPEATED_ACROSS_EXERCISES)

FOLDOVER_TURNOUT = {
  name: 'Foldover Turnout',
  location: BARRE,
  direction: BARRE,
  height: MID
}.merge(REPEATED_SEAT_TURNOUT, REPEATED_ACROSS_EXERCISES)

PRETZEL = {
  name: 'Pretzel',
  location: BARRE,
  direction: L_PROFILE,
  height: FLOOR
}.merge(REPEATED_SEAT_TURNOUT, REPEATED_ACROSS_EXERCISES)

WATERSKI_TURNOUT = {
  name: 'Waterski Turnout',
  location: BARRE,
  direction: BARRE,
  height: STANDING
}.merge(REPEATED_SEAT_TURNOUT, REPEATED_ACROSS_EXERCISES)

STANDING_PRETZEL = {
  name: 'Standing Pretzel',
  location: BARRE,
  direction: L_PROFILE,
  height: STANDING
}.merge(REPEATED_SEAT_TURNOUT, REPEATED_ACROSS_EXERCISES)

TABLETOP_TURNOUT = {
  name: 'Tabletop Turnout',
  location: CENTER,
  direction: FRONT,
  equipment_item_ids: [BALL_ID],
  height: FLOOR
}.merge(REPEATED_SEAT_TURNOUT, REPEATED_ACROSS_EXERCISES)

FETAL = {
  name: 'Fetal',
  location: CENTER,
  direction: FRONT,
  equipment_item_ids: [BALL_ID],
  height: FLOOR
}.merge(REPEATED_SEAT_TURNOUT, REPEATED_ACROSS_EXERCISES)

FLLYING_PRETZEL = {
  name: 'Flying Pretzel',
  location: BARRE,
  direction: BARRE,
  height: MID
}.merge(REPEATED_SEAT_TURNOUT, REPEATED_ACROSS_EXERCISES)

STANDING_STRAIGHT_LEG_DT = {
  name: 'Standing Straight Leg w/ Double Tube',
  location: BARRE,
  direction: L_PROFILE,
  equipment_item_ids: [DOUBLE_TUBE_ID],
  height: STANDING
}.merge(REPEATED_SEAT_TURNOUT, REPEATED_ACROSS_EXERCISES)

SEMI_FOLDOVER_TURNOUT_DT = {
  name: 'Semi Foldover Turnout w/ Double Tube',
  location: BARRE,
  direction: BARRE,
  equipment_item_ids: [DOUBLE_TUBE_ID],
  height: MID
}.merge(REPEATED_SEAT_TURNOUT, REPEATED_ACROSS_EXERCISES)

FOLDOVER_TURNOUT_DT = {
  name: 'Foldover Turnout w/ Double Tube',
  location: BARRE,
  direction: BARRE,
  equipment_item_ids: [DOUBLE_TUBE_ID],
  height: MID
}.merge(REPEATED_SEAT_TURNOUT, REPEATED_ACROSS_EXERCISES)

PRETZEL_DT = {
  name: 'Pretzel w/ Double Tube',
  location: CENTER,
  direction: FRONT,
  equipment_item_ids: [DOUBLE_TUBE_ID],
  height: FLOOR
}.merge(REPEATED_SEAT_TURNOUT, REPEATED_ACROSS_EXERCISES)

WATERSKI_TURNOUT_DT = {
  name: 'Waterski Turnout w/ Double Tube',
  location: BARRE,
  direction: BARRE,
  equipment_item_ids: [DOUBLE_TUBE_ID],
  height: STANDING
}.merge(REPEATED_SEAT_TURNOUT, REPEATED_ACROSS_EXERCISES)

STANDING_PRETZEL_DT = {
  name: 'Standing Pretzel w/ Double Tube',
  location: BARRE,
  direction: BARRE,
  equipment_item_ids: [DOUBLE_TUBE_ID],
  height: STANDING
}.merge(REPEATED_SEAT_TURNOUT, REPEATED_ACROSS_EXERCISES)

TABLETOP_TURNOUT_DT = {
  name: 'Tabletop Turnout w/ Double Tube',
  location: CENTER,
  direction: FRONT,
  equipment_item_ids: [DOUBLE_TUBE_ID],
  height: FLOOR
}.merge(REPEATED_SEAT_TURNOUT, REPEATED_ACROSS_EXERCISES)

FETAL_DT = {
  name: 'Fetal w/ Double Tube',
  location: CENTER,
  direction: FRONT,
  equipment_item_ids: [DOUBLE_TUBE_ID],
  height: FLOOR
}.merge(REPEATED_SEAT_TURNOUT, REPEATED_ACROSS_EXERCISES)

FLYING_PRETZEL_DT = {
  name: 'Flying Pretzel w/ Double Tube',
  location: BARRE,
  direction: R_PROFILE,
  equipment_item_ids: [DOUBLE_TUBE_ID],
  height: FLOOR
}.merge(REPEATED_SEAT_TURNOUT, REPEATED_ACROSS_EXERCISES)

SEAT_TURNOUT = [
  STANDING_STRAIGHT_LEG,
  SEMI_FOLDOVER_TURNOUT,
  FOLDOVER_TURNOUT,
  PRETZEL,
  WATERSKI_TURNOUT,
  STANDING_PRETZEL,
  TABLETOP_TURNOUT,
  FETAL,
  FLLYING_PRETZEL,
  STANDING_STRAIGHT_LEG_DT,
  SEMI_FOLDOVER_TURNOUT_DT,
  FOLDOVER_TURNOUT_DT,
  PRETZEL_DT,
  WATERSKI_TURNOUT_DT,
  STANDING_PRETZEL_DT,
  TABLETOP_TURNOUT_DT,
  FETAL_DT,
  FLYING_PRETZEL_DT
].freeze

puts ".....Seeding #{SEAT_TURNOUT.length} turnout Seat"
SEAT_TURNOUT.each do |st|
  Exercise.create!(st)
end

# ---------------------------------------------
# Exercise Seat Parallel
# ---------------------------------------------

REPEATED_SEAT_PARALLEL = {
  section: SEAT,
  rotation: PARALLEL
}.freeze

STANDING_BENT_LEG = {
  name: 'Standing Bent Leg',
  location: BARRE,
  direction: PROFILE,
  equipment_item_ids: [BALL_ID],
  height: STANDING
}.merge(REPEATED_SEAT_PARALLEL, REPEATED_ACROSS_EXERCISES)

SEMI_FOLDOVER_PARALLEL = {
  name: 'Semi Foldover Parallel',
  location: BARRE,
  direction: BARRE,
  height: MID
}.merge(REPEATED_SEAT_PARALLEL, REPEATED_ACROSS_EXERCISES)

FOLDOVER_PARALLEL = {
  name: 'Foldover Parallel',
  location: BARRE,
  direction: BARRE,
  equipment_item_ids: [BALL_ID],
  height: MID
}.merge(REPEATED_SEAT_PARALLEL, REPEATED_ACROSS_EXERCISES)

TABLETOP_PARALLEL = {
  name: 'Tabletop Parallel',
  location: CENTER,
  direction: PROFILE,
  height: FLOOR
}.merge(REPEATED_SEAT_PARALLEL, REPEATED_ACROSS_EXERCISES)

WATERSKI_PARALLEL = {
  name: 'Waterski Parallel',
  location: BARRE,
  direction: BARRE,
  height: STANDING
}.merge(REPEATED_SEAT_PARALLEL, REPEATED_ACROSS_EXERCISES)

LUNGE = {
  name: 'Lunge',
  location: BARRE,
  direction: BARRE,
  equipment_item_ids: [BALL_ID],
  height: MID
}.merge(REPEATED_SEAT_PARALLEL, REPEATED_ACROSS_EXERCISES)

SEMI_PUSH_UP = {
  name: 'Semi Push-Up',
  location: BARRE,
  direction: BARRE,
  equipment_item_ids: [BALL_ID],
  height: STANDING
}.merge(REPEATED_SEAT_PARALLEL, REPEATED_ACROSS_EXERCISES)

KNEELING_SEAT = {
  name: 'Kneeling',
  location: BARRE,
  direction: BARRE,
  height: FLOOR
}.merge(REPEATED_SEAT_PARALLEL, REPEATED_ACROSS_EXERCISES)

STANDING_BENT_LEG_DT = {
  name: 'Standing Bent Leg w/ Double Tube',
  location: BARRE,
  direction: BARRE,
  equipment_item_ids: [DOUBLE_TUBE_ID],
  height: STANDING
}.merge(REPEATED_SEAT_PARALLEL, REPEATED_ACROSS_EXERCISES)

SEMI_FOLDOVER_PARALLEL_DT = {
  name: 'Semi Foldover Parallel w/ Double Tube',
  location: BARRE,
  direction: BARRE,
  equipment_item_ids: [DOUBLE_TUBE_ID],
  height: MID
}.merge(REPEATED_SEAT_PARALLEL, REPEATED_ACROSS_EXERCISES)

FOLDOVER_PARALLEL_DT = {
  name: 'Foldover Parallel w/ Double Tube',
  location: BARRE,
  direction: BARRE,
  equipment_item_ids: [DOUBLE_TUBE_ID],
  height: MID
}.merge(REPEATED_SEAT_PARALLEL, REPEATED_ACROSS_EXERCISES)

TABLETOP_PARALLEL_DT = {
  name: 'Tabletop Parallel w/ Double Tube',
  location: BARRE,
  direction: CENTER,
  equipment_item_ids: [DOUBLE_TUBE_ID],
  height: FLOOR
}.merge(REPEATED_SEAT_PARALLEL, REPEATED_ACROSS_EXERCISES)

WATERSKI_PARALLEL_DT = {
  name: 'Waterski Parallel w/ Double Tube',
  location: BARRE,
  direction: BARRE,
  equipment_item_ids: [DOUBLE_TUBE_ID],
  height: STANDING
}.merge(REPEATED_SEAT_PARALLEL, REPEATED_ACROSS_EXERCISES)

LUNGE_DT = {
  name: 'Lunge w/ Double Tube',
  location: BARRE,
  direction: BARRE,
  equipment_item_ids: [DOUBLE_TUBE_ID],
  height: MID
}.merge(REPEATED_SEAT_PARALLEL, REPEATED_ACROSS_EXERCISES)

LOW_SEMI_FOLDOVER_DT = {
  name: 'Low Semi Foldover w/ Double Tube',
  location: BARRE,
  direction: BARRE,
  equipment_item_ids: [DOUBLE_TUBE_ID],
  height: MID
}.merge(REPEATED_SEAT_PARALLEL, REPEATED_ACROSS_EXERCISES)

SEMI_PUSH_UP_PARALLEL_DT = {
  name: 'Semi Push Up Parallel w/ Double Tube',
  location: BARRE,
  direction: BARRE,
  equipment_item_ids: [DOUBLE_TUBE_ID],
  height: MID
}.merge(REPEATED_SEAT_PARALLEL, REPEATED_ACROSS_EXERCISES)

KNEELING_SEAT_DT = {
  name: 'Kneeling w/ Double Tube',
  location: BARRE,
  direction: PROFILE,
  equipment_item_ids: [DOUBLE_TUBE_ID],
  height: FLOOR
}.merge(REPEATED_SEAT_PARALLEL, REPEATED_ACROSS_EXERCISES)

FACE_DOWN_DT = {
  name: 'Face Down w/ Double Tube',
  location: CENTER,
  direction: PROFILE,
  equipment_item_ids: [DOUBLE_TUBE_ID, MAT],
  height: FLOOR
}.merge(REPEATED_SEAT_PARALLEL, REPEATED_ACROSS_EXERCISES)

SEAT_PARALLEL = [
  STANDING_BENT_LEG,
  SEMI_FOLDOVER_PARALLEL,
  FOLDOVER_PARALLEL,
  TABLETOP_PARALLEL,
  WATERSKI_PARALLEL,
  LUNGE,
  SEMI_PUSH_UP,
  KNEELING_SEAT,
  STANDING_BENT_LEG_DT,
  SEMI_FOLDOVER_PARALLEL_DT,
  FOLDOVER_PARALLEL_DT,
  TABLETOP_PARALLEL_DT,
  WATERSKI_PARALLEL_DT,
  LUNGE_DT,
  LOW_SEMI_FOLDOVER_DT,
  SEMI_PUSH_UP_PARALLEL_DT,
  KNEELING_SEAT_DT,
  FACE_DOWN_DT
].freeze

puts ".....Seeding #{SEAT_PARALLEL.length} parallel Seat"
SEAT_PARALLEL.each do |sp|
  Exercise.create!(sp)
end

# ---------------------------------------------
# Exercise Core Focus
# ---------------------------------------------

REPEATED_CORE_FOCUS = {
  section: CORE_FOCUS
}

BARRE_PLANK_A = {
  name: 'Barre Plank A',
  location: BARRE,
  direction: BARRE
}.merge(REPEATED_CORE_FOCUS, REPEATED_ACROSS_EXERCISES)

BARRE_PLANK_B = {
  name: 'Barre Plank B',
  location: BARRE,
  direction: BARRE,
  equipment_item_ids: [BALL_ID]
}.merge(REPEATED_CORE_FOCUS, REPEATED_ACROSS_EXERCISES)

FLOOR_PLANK_A = {
  name: 'Floor Plank A',
  location: CENTER,
  direction: PROFILE,
  equipment_item_ids: [BALL_ID]
}.merge(REPEATED_CORE_FOCUS, REPEATED_ACROSS_EXERCISES)

FLOOR_PLANK_B = {
  name: 'Floor Plank B',
  location: CENTER,
  direction: PROFILE,
  equipment_item_ids: [DOUBLE_TUBE_ID]
}.merge(REPEATED_CORE_FOCUS, REPEATED_ACROSS_EXERCISES)

FEET_ON_BARRE_A = {
  name: 'Feet on Barre A',
  location: BARRE,
  direction: BARRE
}.merge(REPEATED_CORE_FOCUS, REPEATED_ACROSS_EXERCISES)

FEET_ON_BARRE_B = {
  name: 'Feet on Barre B',
  location: BARRE,
  direction: BARRE,
  equipment_item_ids: [DOUBLE_TUBE_ID]
}.merge(REPEATED_CORE_FOCUS, REPEATED_ACROSS_EXERCISES)

FOREARMS_FACE_UP_A = {
  name: 'Forearms Face Up A',
  location: CENTER,
  direction: PROFILE
}.merge(REPEATED_CORE_FOCUS, REPEATED_ACROSS_EXERCISES)

FOREARMS_FACE_UP_B = {
  name: 'Forearms Face Up B',
  location: CENTER,
  direction: PROFILE,
  equipment_item_ids: [DOUBLE_TUBE_ID]
}.merge(REPEATED_CORE_FOCUS, REPEATED_ACROSS_EXERCISES)

FOREARMS_FACE_UP_C = {
  name: 'Forearms Face Up C',
  location: CENTER,
  direction: PROFILE
}.merge(REPEATED_CORE_FOCUS, REPEATED_ACROSS_EXERCISES)

ROUNDBACK = {
  name: 'Roundback',
  location: BARRE,
  direction: CENTER,
  equipment_item_ids: [DOUBLE_TUBE_ID]
}.merge(REPEATED_CORE_FOCUS, REPEATED_ACROSS_EXERCISES)

FLATBACK_ROUNDBACK_HINGED_FLATBACK = {
  name: 'Flatback/Roundback/Highed Flatback',
  location: BARRE,
  direction: CENTER
}.merge(REPEATED_CORE_FOCUS, REPEATED_ACROSS_EXERCISES)

FLATBACK = {
  name: 'Flatback',
  location: BARRE,
  direction: CENTER,
  equipment_item_ids: [BALL_ID]
}.merge(REPEATED_CORE_FOCUS, REPEATED_ACROSS_EXERCISES)

CORE_FOCUS_Q3 = [
  BARRE_PLANK_A,
  BARRE_PLANK_B,
  FLOOR_PLANK_A,
  FLOOR_PLANK_B,
  FEET_ON_BARRE_A,
  FEET_ON_BARRE_B,
  FOREARMS_FACE_UP_A,
  FOREARMS_FACE_UP_B,
  FOREARMS_FACE_UP_C,
  ROUNDBACK,
  FLATBACK_ROUNDBACK_HINGED_FLATBACK,
  FLATBACK
]

puts ".....Seeding #{CORE_FOCUS_Q3.length} Core Focus"
CORE_FOCUS_Q3.each do |cf|
  Exercise.create!(cf)
end

# ---------------------------------------------
# Exercise Abs
# ---------------------------------------------

A1_COMBO_A = {
  name: 'Abs 1: Combo A',
  section: ABS1,
  location: CENTER,
  direction: PROFILE,
  equipment_item_ids: [MAT]
}.merge(REPEATED_ACROSS_EXERCISES)

A1_COMBO_B = {
  name: 'Abs 1: Combo B',
  section: ABS1,
  location: CENTER,
  direction: PROFILE,
  equipment_item_ids: [MAT, BALL_ID]
}.merge(REPEATED_ACROSS_EXERCISES)

A1_COMBO_C = {
  name: 'Abs 1: Combo C',
  section: ABS1,
  location: CENTER,
  direction: PROFILE,
  equipment_item_ids: [MAT]
}.merge(REPEATED_ACROSS_EXERCISES)

A1_AT_BARRE = {
  name: 'Abs 1: At Barre',
  section: ABS1,
  location: BARRE,
  direction: CENTER,
  equipment_item_ids: [MAT, DOUBLE_TUBE_ID]
}.merge(REPEATED_ACROSS_EXERCISES)

A1_CENTER = {
  name: 'Abs 1: Center of Room',
  section: ABS1,
  location: CENTER,
  direction: PROFILE,
  equipment_item_ids: [MAT, DOUBLE_TUBE_ID]
}.merge(REPEATED_ACROSS_EXERCISES)

A2_COMBO_A = {
  name: 'Abs 2: Combo A',
  section: ABS2,
  location: CENTER,
  direction: PROFILE,
  equipment_item_ids: [MAT]
}.merge(REPEATED_ACROSS_EXERCISES)

A2_COMBO_B = {
  name: 'Abs 2: Combo B',
  section: ABS2,
  location: CENTER,
  direction: PROFILE,
  equipment_item_ids: [MAT, BALL_ID]
}.merge(REPEATED_ACROSS_EXERCISES)

A2_COMBO_C = {
  name: 'Abs 2: Combo C',
  section: ABS2,
  location: CENTER,
  direction: PROFILE,
  equipment_item_ids: [MAT]
}.merge(REPEATED_ACROSS_EXERCISES)

A2_AT_BARRE = {
  name: 'Abs 2: At Barre',
  section: ABS2,
  location: BARRE,
  direction: CENTER,
  equipment_item_ids: [MAT, DOUBLE_TUBE_ID]
}.merge(REPEATED_ACROSS_EXERCISES)

A2_CENTER_OF_ROOM = {
  name: 'Abs 2: Center of Room',
  section: ABS2,
  location: CENTER,
  direction: PROFILE,
  equipment_item_ids: [MAT, DOUBLE_TUBE_ID]
}.merge(REPEATED_ACROSS_EXERCISES)

A3_COMBO_A = {
  name: 'Abs 3: Combo A',
  section: ABS3,
  location: CENTER,
  direction: PROFILE,
  equipment_item_ids: [MAT]
}.merge(REPEATED_ACROSS_EXERCISES)

A3_COMBO_B = {
  name: 'Abs 3: Combo B',
  section: ABS3,
  location: CENTER,
  direction: PROFILE,
  equipment_item_ids: [MAT, BALL_ID]
}.merge(REPEATED_ACROSS_EXERCISES)

A3_COMBO_C = {
  name: 'Abs 3: Combo C',
  section: ABS3,
  location: CENTER,
  direction: PROFILE,
  equipment_item_ids: [MAT]
}.merge(REPEATED_ACROSS_EXERCISES)

A3_AT_BARRE = {
  name: 'Abs 3: At Barre',
  section: ABS3,
  location: BARRE,
  direction: CENTER,
  equipment_item_ids: [MAT, DOUBLE_TUBE_ID]
}.merge(REPEATED_ACROSS_EXERCISES)

A3_CENTER_OF_ROOM = {
  name: 'Abs 3: Center of Room',
  section: ABS3,
  location: CENTER,
  direction: PROFILE,
  equipment_item_ids: [MAT, DOUBLE_TUBE_ID]
}.merge(REPEATED_ACROSS_EXERCISES)

ABS = [
  A1_COMBO_A,
  A1_COMBO_B,
  A1_COMBO_C,
  A1_AT_BARRE,
  A1_CENTER,
  A2_COMBO_A,
  A2_COMBO_B,
  A2_COMBO_C,
  A2_AT_BARRE,
  A2_CENTER_OF_ROOM,
  A3_COMBO_A,
  A3_COMBO_B,
  A3_COMBO_C,
  A3_AT_BARRE,
  A3_CENTER_OF_ROOM
]

puts ".....Seeding #{ABS.length} Abs"
ABS.each do |a|
  Exercise.create!(a)
end

# ---------------------------------------------
# Exercise Back Extension
# ---------------------------------------------

BE_COMBO_A = {
  name: 'Combo A',
  section: BACK_EXTENSION,
  equipment_item_ids: [MAT, BALL_ID]
}.merge(REPEATED_ACROSS_EXERCISES)

BE_COMBO_B = {
  name: 'Combo B',
  section: BACK_EXTENSION,
  equipment_item_ids: [MAT]
}.merge(REPEATED_ACROSS_EXERCISES)

BE_COMBO_C = {
  name: 'Combo C',
  section: BACK_EXTENSION,
  equipment_item_ids: [MAT]
}.merge(REPEATED_ACROSS_EXERCISES)

BE = [BE_COMBO_A, BE_COMBO_B, BE_COMBO_C]

puts ".....Seeding #{BE.length} Back Extension"
BE.each do |be|
  Exercise.create!(be)
end

# ---------------------------------------------
# Exercise Back Dancing
# ---------------------------------------------

BD_COMBO_A = {
  name: "Combo A - Parallel Together",
  section: BACK_DANCING,
  equipment_item_ids: [MAT, BALL_ID]
}.merge(REPEATED_ACROSS_EXERCISES)

BD_COMBO_B = {
  name: "Combo B - Hip Width",
  section: BACK_DANCING,
  equipment_item_ids: [MAT]
}.merge(REPEATED_ACROSS_EXERCISES)

BD_COMBO_C = {
  name: "Combo C - V/Wide 2nd",
  section: BACK_DANCING,
  equipment_item_ids: [MAT]
}.merge(REPEATED_ACROSS_EXERCISES)

BD_COMBO_A_DT = {
  name: "Combo A - Parallel Together w/ Double Tube",
  section: BACK_DANCING,
  equipment_item_ids: [MAT, DOUBLE_TUBE_ID]
}.merge(REPEATED_ACROSS_EXERCISES)

BD_COMBO_B_DT = {
  name: "Combo B - High V w/ Double Tube",
  section: BACK_DANCING,
  equipment_item_ids: [MAT, DOUBLE_TUBE_ID]
}.merge(REPEATED_ACROSS_EXERCISES)

BD_COMBO_C_DT = {
  name: "Combo C - Wide 2nd w/ Double Tube",
  section: BACK_DANCING,
  equipment_item_ids: [MAT, DOUBLE_TUBE_ID]
}.merge(REPEATED_ACROSS_EXERCISES)

BD = [
  BD_COMBO_A,
  BD_COMBO_B,
  BD_COMBO_C,
  BD_COMBO_A_DT,
  BD_COMBO_B_DT,
  BD_COMBO_C_DT
]

puts ".....Seeding #{BD.length} Back Dancing"
BD.each do |bd|
  Exercise.create!(bd)
end

puts 'Completed Seeding the DB!'
