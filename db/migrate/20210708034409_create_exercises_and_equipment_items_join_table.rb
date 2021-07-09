# frozen_string_literal: true

class CreateExercisesAndEquipmentItemsJoinTable < ActiveRecord::Migration[6.1]
  def change
    create_table :equipment_items_exercises, id: false do |t|
      t.belongs_to :exercise
      t.belongs_to :equipment_item
    end
  end
end
