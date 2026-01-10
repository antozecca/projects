class AddIndexToPartnersEmail < ActiveRecord::Migration[6.1]
  def change
    add_index :partners, :email, unique: true
  end
end
