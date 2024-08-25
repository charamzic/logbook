class AddRoundTripToTrips < ActiveRecord::Migration[7.2]
  def change
    add_column :trips, :round_trip, :boolean, default: false
  end
end
