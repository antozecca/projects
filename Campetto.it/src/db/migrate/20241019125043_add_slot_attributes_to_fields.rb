class AddSlotAttributesToFields < ActiveRecord::Migration[6.1]
  def change
    add_column :fields, :start_time, :datetime
    add_column :fields, :end_time, :datetime
    add_column :fields, :interval, :integer
    add_column :fields, :exclude_days, :string
  end
end
