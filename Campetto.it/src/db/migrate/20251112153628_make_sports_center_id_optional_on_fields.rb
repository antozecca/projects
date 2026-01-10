class MakeSportsCenterIdOptionalOnFields < ActiveRecord::Migration[6.1]
  def change
    # consente NULL sulla colonna
    change_column_null :fields, :sports_center_id, true

  end
end
