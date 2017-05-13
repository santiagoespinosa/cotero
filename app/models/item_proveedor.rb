class ItemProveedor < ActiveRecord::Base
  belongs_to :item
  belongs_to :proveedor
end
