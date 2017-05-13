json.extract! item_pedido, :id, :nombre, :valor, :disponible, :proveedor_id, :cantidad, :item_id, :estado_actual, :created_at, :updated_at
json.url item_pedido_url(item_pedido, format: :json)
