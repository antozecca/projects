class MakeSportsCenterIdNullableOnFields < ActiveRecord::Migration[6.1]
  def change
    change_column_null :fields, :sports_center_id, true
  end
end
