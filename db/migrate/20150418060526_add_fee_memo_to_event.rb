class AddFeeMemoToEvent < ActiveRecord::Migration
  def change
    add_column :events, :fee_memo, :string
  end
end
