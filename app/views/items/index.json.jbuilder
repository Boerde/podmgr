json.array!(@items) do |item|
  json.extract! item, :id, :title, :series, :speaker, :summary, :file_path
  json.url item_url(item, format: :json)
end
