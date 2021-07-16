class CreateBarreClassExercises < ActiveRecord::Migration[6.1]
  def change
    create_table :barre_class_exercises do |t|
      t.integer :exercise_id
      t.integer :barre_class_id

      t.timestamps
    end
  end
end
