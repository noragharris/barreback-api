class CreateBarreClasses < ActiveRecord::Migration[6.1]
  def change
    create_table :barre_classes do |t|
      t.string :location
      t.integer :class_type
      # TODO: date and start time, duration, etc

      t.timestamps
    end
  end
end
