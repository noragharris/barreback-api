# frozen_string_literal: true

# Ball, Double Tube, Weights, Sliders, Bottom Tubes, Top Tubes, Platform, Mat

class EquipmentItem < ApplicationRecord
  has_and_belongs_to_many :exercises

  validates :name, presence: true
end
