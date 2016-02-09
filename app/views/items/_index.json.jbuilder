json.array!(@items) do |item|
  json.extract! item, :id, :name, :content, :price, :time, :unit, :author, :location, :telephone, :rent
  json.url item_url(item, format: :json)
end
