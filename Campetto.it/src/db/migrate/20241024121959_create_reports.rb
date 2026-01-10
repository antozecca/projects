class CreateReports < ActiveRecord::Migration[6.0]
  def change
    create_table :reports do |t|
      t.references :reportable, polymorphic: true, index: true
      t.references :reporter, polymorphic: true, index: true
      t.integer :status, default: 0 
      t.text :details

      t.timestamps
    end
  end
end

