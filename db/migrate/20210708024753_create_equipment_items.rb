# frozen_string_literal: true

class CreateEquipmentItems < ActiveRecord::Migration[6.1]
  def change
    create_table :equipment_items do |t|
      t.string :name

      t.timestamps
    end
  end
end
