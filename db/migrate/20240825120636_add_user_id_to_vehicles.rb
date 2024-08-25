class AddUserIdToVehicles < ActiveRecord::Migration[7.2]
  def change
    add_column :vehicles, :user_id, :integer
    add_index :vehicles, :user_id
  end
end
