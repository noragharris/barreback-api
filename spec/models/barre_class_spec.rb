require 'rails_helper'

RSpec.describe BarreClass, type: :model do
  it { should have_many :exercises }
  it { should have_many :barre_class_exercises }

  it { should validate_presence_of(:location) }
end
