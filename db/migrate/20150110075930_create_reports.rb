class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.integer :event_id
      t.string :short_desc
      t.text :long_desc
      t.binary :picture_1, limit: 16777215
      t.binary :picture_2, limit: 16777215
      t.binary :picture_3, limit: 16777215
      t.boolean :visible

      t.timestamps
    end
  end
end
