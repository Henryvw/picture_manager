json.array!(@monuments) do |monument|
  json.extract! monument, :id, :name, :description, :category_id
  json.url monument_url(monument, format: :json)
end
