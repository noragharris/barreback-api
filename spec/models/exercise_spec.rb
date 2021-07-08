require 'rails_helper'

RSpec.describe Exercise, type: :model do
  it_behaves_like 'quarter'
  it_behaves_like 'class_type'

  it { should have_and_belong_to_many :equipment_items }

  it { should validate_presence_of(:name) }
  it { should validate_numericality_of(:year) }
  it { should define_enum_for(:rotation).with_values(Exercise.rotations) }
  it { should define_enum_for(:section).with_values(Exercise.sections) }
  it { should define_enum_for(:location).with_values(Exercise.locations) }
  it { should define_enum_for(:direction).with_values(Exercise.directions).with_prefix(:direction) }
  it { should define_enum_for(:height).with_values(Exercise.heights) }
end
