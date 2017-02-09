json.extract! event, :id, :org, :date, :user_id, :contact, :industry, :body, :social, :created_at, :updated_at
json.url event_url(event, format: :json)