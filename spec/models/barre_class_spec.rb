require 'rails_helper'

RSpec.describe BarreClass, type: :model do
  it_behaves_like 'class_type'

  it { should have_many :exercises }
  it { should have_many :barre_class_exercises }

  it { should validate_presence_of(:location) }
end
