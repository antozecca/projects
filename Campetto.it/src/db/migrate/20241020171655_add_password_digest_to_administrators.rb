class AddPasswordDigestToAdministrators < ActiveRecord::Migration[6.1]
  def change
    add_column :administrators, :password_digest, :string
  end
end
