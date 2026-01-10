class AddRootToAdministrators < ActiveRecord::Migration[6.1]
  def change
    add_column :administrators, :root, :boolean, default: false
  end
end
