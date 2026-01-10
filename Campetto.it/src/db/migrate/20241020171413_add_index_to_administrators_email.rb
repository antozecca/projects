class AddIndexToAdministratorsEmail < ActiveRecord::Migration[6.1]
  def change
    add_index :administrators, :email, unique: true
  end
end
