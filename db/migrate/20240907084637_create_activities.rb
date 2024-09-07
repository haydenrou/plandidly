class CreateActivities < ActiveRecord::Migration[7.1]
  def change
    create_table :activities do |t|
      t.string :title
      t.string :address
      t.references :trip, null: false, foreign_key: true
      t.string :reference_number
      t.datetime :start_at
      t.datetime :end_at

      t.timestamps
    end
  end
end
