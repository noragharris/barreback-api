class CreateEquipmentItemExerciseJoinTable < ActiveRecord::Migration[6.1]
  def change
    create_table :equipment_items_exercises, id: false do |t|
      t.integer :exercise_id
      t.integer :equipment_item_id
    end
  end
end
