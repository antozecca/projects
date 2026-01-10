class AddAddressFieldsToFields < ActiveRecord::Migration[6.1]
  def change
    add_column :fields, :via, :string
    add_column :fields, :citta, :string
    add_column :fields, :cap, :string
  end
end
