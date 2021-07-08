class CreateExercises < ActiveRecord::Migration[6.1]
  def change
    create_table :exercises do |t|
      t.string :name
      t.integer :quarter
      t.integer :year
      t.integer :class_type
      t.integer :rotation
      t.integer :section
      t.integer :location
      t.integer :direction
      t.integer :height
      t.boolean :pull_off, default: false
      t.boolean :two_sided, default: false
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
