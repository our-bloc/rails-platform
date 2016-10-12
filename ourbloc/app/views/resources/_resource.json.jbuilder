json.extract! resource, :id, :title, :body, :created_at, :updated_at
json.url resource_url(resource, format: :json)