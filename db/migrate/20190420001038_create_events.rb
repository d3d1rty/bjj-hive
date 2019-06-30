class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name
      t.text :summary
      t.decimal :fee, precision: 8, scale: 2
      t.date :start_date
      t.time :start_time
      t.date :end_date
      t.time :end_time
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
