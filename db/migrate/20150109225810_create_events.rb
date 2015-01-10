class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :user_id
      t.string :title
      t.date :opendate
      t.string :opendate_memo
      t.string :postal
      t.string :address
      t.string :address_embed
      t.integer :fee
      t.integer :limit
      t.string :desc_short
      t.text :desc_long
      t.binary :picture_main, limit: 16777215
      t.binary :picture_1, limit: 16777215
      t.binary :picture_2, limit: 16777215
      t.binary :picture_3, limit: 16777215
      t.string :url
      t.string :url_facebook
      t.string :url_twitter
      t.boolean :visible

      t.timestamps
    end
  end
end
