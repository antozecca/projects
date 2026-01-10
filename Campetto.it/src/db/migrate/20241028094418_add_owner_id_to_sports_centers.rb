class AddOwnerIdToSportsCenters < ActiveRecord::Migration[6.1]
  def change
    add_reference :sports_centers, :owner, foreign_key: { to_table: :partners }
  end
end
