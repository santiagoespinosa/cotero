class CategoriaProveedor < ActiveRecord::Base
  belongs_to :proveedor
  belongs_to :categorium
end
