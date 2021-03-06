# frozen_string_literal: true

require 'rails_helper'

RSpec.describe EquipmentItem, type: :model do
  it { should validate_presence_of(:name) }
  it { should have_and_belong_to_many :exercises }
end
