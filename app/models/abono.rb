class Abono < ActiveRecord::Base
  belongs_to :proveedor
  belongs_to :pedido
  belongs_to :user
end
