class AddNomeCognomeToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :nome, :string
    add_column :users, :cognome, :string
  end
end
