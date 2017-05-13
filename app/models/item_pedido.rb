class ItemPedido < ActiveRecord::Base
  belongs_to :proveedor
  belongs_to :item
end
