json.array!(@feeds) do |feed|
  json.extract! feed, :id, :title, :author, :link, :language, :copyright, :description, :logo, :summary, :owner_name, :owner_mail, :category
  json.url feed_url(feed, format: :json)
end
