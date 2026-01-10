class CreateSlots < ActiveRecord::Migration[6.1]
  def change
    create_table :slots do |t|
      t.references :field, null: false, foreign_key: true
      t.datetime :start_time
      t.datetime :end_time
      t.boolean :booked

      t.timestamps
    end
  end
end
