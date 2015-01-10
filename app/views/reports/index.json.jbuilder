json.array!(@reports) do |report|
  json.extract! report, :id, :event_id, :short_desc, :long_desc, :picture_1, :picture_2, :picture_3, :visible
  json.url report_url(report, format: :json)
end
