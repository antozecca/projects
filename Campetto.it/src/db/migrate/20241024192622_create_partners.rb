class CreatePartners < ActiveRecord::Migration[6.1]
  def change
    create_table :partners do |t|
      t.string :name
      t.string :surname
      t.string :gender
      t.date :birthdate
      t.string :mobile
      t.string :email
      t.string :password_digest
      t.string :remember_digest

      t.timestamps
    end
  end
end
