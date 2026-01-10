class AddActivationToPartners < ActiveRecord::Migration[6.1]
  def change
    add_column :partners, :activation_digest, :string
    add_column :partners, :activated, :boolean, default: false
    add_column :partners, :activated_at, :datetime
  end
end
