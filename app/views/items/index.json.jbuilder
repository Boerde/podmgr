json.array!(@items) do |item|
  json.extract! item, :id, :title, :series, :speaker, :summary, :publication_date
  json.url item_url(item, format: :json)
end
