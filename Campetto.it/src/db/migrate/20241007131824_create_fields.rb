class CreateFields < ActiveRecord::Migration[6.1]
  def change
    create_table :fields do |t|
      t.string :nome
      t.text :descrizione
      t.string :sport
      t.decimal :prezzo
      t.decimal :latitudine
      t.decimal :longitudine

      t.timestamps
    end
  end
end
