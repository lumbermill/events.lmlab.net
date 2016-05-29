class AddHostToEvent < ActiveRecord::Migration
  def change
    add_column :events, :host, :string, null: false, default: ""
  end
end
