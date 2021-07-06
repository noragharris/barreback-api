class CreateExercises < ActiveRecord::Migration[6.1]
  def change
    create_table :exercises do |t|
      t.string :name
      t.integer :quarter
      t.integer :year
      t.integer :class_type

      t.timestamps
    end
  end
end
