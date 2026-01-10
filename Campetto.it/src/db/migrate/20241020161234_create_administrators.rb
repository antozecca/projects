class CreateAdministrators < ActiveRecord::Migration[6.1]
  def change
    create_table :administrators do |t|
      t.string :email
      t.string :name
      t.string :surname
      t.string :password

      t.timestamps
    end
  end
end
