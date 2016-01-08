json.array!(@items) do |item|
  json.extract! item, :id, :title, :series, :speaker, :summary, :file_path, :image_path, :publication_date
  json.url item_url(item, format: :json)
end
