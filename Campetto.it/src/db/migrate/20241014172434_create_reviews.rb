class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.string :titolo
      t.integer :valutazione
      t.text :testo
      t.references :user, null: false, foreign_key: true
      t.references :field, null: false, foreign_key: true

      t.timestamps
    end
  end
end

