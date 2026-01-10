class CreateJoinTablePartnersSportsCenters < ActiveRecord::Migration[6.1]
  def change
    create_join_table :partners, :sports_centers do |t|
      t.index [:partner_id, :sports_center_id], unique: true, name: 'index_partners_sports_centers_on_partner_and_center'
      t.index [:sports_center_id, :partner_id], unique: true, name: 'index_sports_centers_partners_on_center_and_partner'
    end
  end
end
