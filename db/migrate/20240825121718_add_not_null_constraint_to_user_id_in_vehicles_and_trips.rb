class AddNotNullConstraintToUserIdInVehiclesAndTrips < ActiveRecord::Migration[7.0]
  def change
    change_column_null :vehicles, :user_id, false
    change_column_null :trips, :user_id, false
  end
end
