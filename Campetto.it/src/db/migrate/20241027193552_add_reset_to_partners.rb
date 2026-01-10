class AddResetToPartners < ActiveRecord::Migration[6.1]
  def change
    add_column :partners, :reset_digest, :string
    add_column :partners, :reset_sent_at, :datetime
  end
end
