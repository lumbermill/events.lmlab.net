json.array!(@events) do |event|
  json.extract! event, :id, :user_id, :title, :opendate, :opendate_memo, :address, :postal, :address_embed, :fee, :limit, :desc_short, :desc_long, :picture_main, :picture_1, :picture_2, :picture_3, :url, :url_facebook, :url_twitter, :visible
  json.url event_url(event, format: :json)
end
