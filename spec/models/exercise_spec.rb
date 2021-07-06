require 'rails_helper'

RSpec.describe Exercise, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_inclusion_of(:quarter).in_array(%w[Q1 Q2 Q3 Q4]) }
  it { should validate_numericality_of(:year) }
end
