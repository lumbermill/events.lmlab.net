class AddColumnsToEvent < ActiveRecord::Migration
  def change
    add_column :events, :has_entry, :boolean
    add_column :events, :address_memo, :string
    add_column :events, :address_url, :string
  end
end
