class CreateFuelTypes < ActiveRecord::Migration[7.2]
  def change
    create_table :fuel_types do |t|
      t.string :name
      t.decimal :price_per_liter, precision: 10, scale: 2

      t.timestamps
    end
  end
end
