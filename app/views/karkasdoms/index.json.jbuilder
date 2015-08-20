json.array!(@karkasdoms) do |karkasdom|
  json.extract! karkasdom, :id
  json.url karkasdom_url(karkasdom, format: :json)
end
