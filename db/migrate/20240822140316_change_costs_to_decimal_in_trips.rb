class ChangeCostsToDecimalInTrips < ActiveRecord::Migration[7.2]
  def change
      change_column :trips, :costs, :decimal, precision: 10, scale: 2
  end
end
