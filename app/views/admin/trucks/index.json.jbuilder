json.array!(@trucks) do |truck|
  json.extract! truck, :id, :name, :slug, :description
  json.url admin_truck_url(truck, format: :json)
end
