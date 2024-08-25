class CreateTrips < ActiveRecord::Migration[7.2]
  def change
    create_table :trips do |t|
      t.string :origin
      t.string :destination
      t.references :vehicle, null: false, foreign_key: true
      t.float :distance
      t.integer :costs

      t.timestamps
    end
  end
end
