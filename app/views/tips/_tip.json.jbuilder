json.extract! tip, :id, :title, :body, :industry, :link, :created_at, :updated_at
json.url tip_url(tip, format: :json)