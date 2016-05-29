class ChangeAddressEmbedInEvent < ActiveRecord::Migration
  def change
    change_column :events, :address_embed, :string, null: false, default: "", limit: 2000
  end
end
