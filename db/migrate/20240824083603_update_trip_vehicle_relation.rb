class UpdateTripVehicleRelation < ActiveRecord::Migration[7.2]
  def change
    remove_column :trips, :vehicle, :string
    add_reference :trips, :vehicle, foreign_key: true
  end
end
