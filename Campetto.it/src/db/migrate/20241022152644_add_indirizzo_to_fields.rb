class AddIndirizzoToFields < ActiveRecord::Migration[6.1]
  def change
    add_column :fields, :indirizzo, :string
  end
end
