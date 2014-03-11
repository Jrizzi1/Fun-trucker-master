json.array!(@rallies) do |rally|
  json.extract! rally, :id, :name, :slug, :start_at, :end_at
  json.url admin_rally_url(rally, format: :json)
end
