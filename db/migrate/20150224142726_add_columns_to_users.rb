class AddColumnsToUsers < ActiveRecord::Migration
  # For facebook login.
  def change
    add_column :users, :provider, :string
    add_column :users, :uid, :string
  end
end
