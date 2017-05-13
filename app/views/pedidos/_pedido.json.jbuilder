json.extract! pedido, :id, :pedido_hash, :estado_actual, :restaurante_id, :fechahora_solicitada, :fechahora_estimada, :fee, :created_at, :updated_at
json.url pedido_url(pedido, format: :json)
