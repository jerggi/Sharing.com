json.array!(@categories) do |category|
  json.extract! category, :id, :name, :avatar
  json.url category_url(category, format: :json)
end
