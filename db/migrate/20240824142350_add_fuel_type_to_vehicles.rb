class AddFuelTypeToVehicles < ActiveRecord::Migration[7.2]
  def change
    add_reference :vehicles, :fuel_type, foreign_key: true
  end
end
