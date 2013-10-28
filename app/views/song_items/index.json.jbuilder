json.array!(@song_items) do |song_item|
  json.extract! song_item, :path, :title, :album, :artist, :genre
  json.url song_item_url(song_item, format: :json)
end
