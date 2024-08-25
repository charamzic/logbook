class RenameKmTotalToDistanceInTrips < ActiveRecord::Migration[7.2]
  def change
    rename_column :trips, :km_total, :distance
  end
end
