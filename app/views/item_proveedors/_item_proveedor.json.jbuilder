json.extract! item_proveedor, :id, :item_id, :proveedor_id, :precio, :created_at, :updated_at
json.url item_proveedor_url(item_proveedor, format: :json)
