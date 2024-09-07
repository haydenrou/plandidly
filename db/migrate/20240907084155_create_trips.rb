class CreateTrips < ActiveRecord::Migration[7.1]
  def change
    create_table :trips do |t|
      t.string :title
      t.string :location
      t.datetime :start_at
      t.datetime :end_at

      t.timestamps
    end
  end
end
