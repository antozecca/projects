class AddFkAndIndexToFieldsSportsCenter < ActiveRecord::Migration[6.1]
  def change
    add_index :fields, :sports_center_id unless index_exists?(:fields, :sports_center_id)
    add_foreign_key :fields, :sports_centers unless foreign_key_exists?(:fields, :sports_centers)
  end
end
