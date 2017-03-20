json.array!(@upcomings) do |event|
  json.extract! event, :id, :user_id, :title, :opendate, :opendate_memo, :address, :postal, :address_embed, :fee, :limit, :desc_short, :desc_long, :url, :url_facebook, :url_twitter, :visible
  json.url event_url(event, format: :html)
  #  :picture_main, :picture_1, :picture_2, :picture_3,
end
