json.extract! restaurante, :id, :nombre, :user_id, :created_at, :updated_at
json.url restaurante_url(restaurante, format: :json)
