json.array!(@feeds) do |feed|
  json.extract! feed, :id, :title, :author, :link, :language, :copyright, :description, :logo
  json.url feed_url(feed, format: :json)
end
