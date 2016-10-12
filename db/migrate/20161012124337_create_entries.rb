class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.integer :event_id
      t.string :email
      t.string :name
      t.string :message

      t.timestamps
    end
  end
end
