class CreateVehicles < ActiveRecord::Migration[7.2]
  def change
    create_table :vehicles do |t|
      t.string :name
      t.float :fuel_consumption
      t.integer :total_km
      t.references :fuel_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
