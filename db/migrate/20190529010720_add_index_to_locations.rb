class AddIndexToLocations < ActiveRecord::Migration[5.2]
  def change
    add_index :locations, [:latitude, :longitude]
  end
end
