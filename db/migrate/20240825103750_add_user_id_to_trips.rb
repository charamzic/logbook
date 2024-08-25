class AddUserIdToTrips < ActiveRecord::Migration[7.2]
  def change
    add_column :trips, :user_id, :integer
    add_index :trips, :user_id
  end
end
