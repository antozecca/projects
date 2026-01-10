class CreateSportsCenters < ActiveRecord::Migration[6.1]
  def change
    create_table :sports_centers do |t|
      t.string :tax_code
      t.string :vat_number
      t.string :company_name
      t.string :iban
      t.string :email
      t.string :phone
      t.string :registered_office

      t.timestamps
    end
  end
end
