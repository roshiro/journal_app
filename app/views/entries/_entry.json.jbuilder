json.extract! entry, :id, :title, :symbol, :content, :open_date, :close_date, :result, :created_at, :updated_at
json.url entry_url(entry, format: :json)
