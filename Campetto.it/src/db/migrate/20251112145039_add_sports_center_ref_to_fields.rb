class AddSportsCenterRefToFields < ActiveRecord::Migration[6.1]
  def change
    add_reference :fields, :sports_center, foreign_key: true # ← niente null: false
  end
end
