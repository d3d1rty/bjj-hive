class RemoveStartTimeAndEndTimeFromEvents < ActiveRecord::Migration[6.0]
  def change
    remove_column :events, :start_time
    remove_column :events, :end_time
  end
end
