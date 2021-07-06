require 'rails_helper'

RSpec.describe Exercise, type: :model do
  it { should validate_presence_of(:name) }
  it { should define_enum_for(:quarter).with_values(Exercise.quarters) }
  it { should validate_numericality_of(:year) }
  it { should define_enum_for(:class_type).with_values(Exercise.class_types) }
end
