class MakeFieldsSportsCenterIdNotNull < ActiveRecord::Migration[6.1]
  def up
    change_column_null :fields, :sports_center_id, false
  end
  def down
    change_column_null :fields, :sports_center_id, true
  end
end
