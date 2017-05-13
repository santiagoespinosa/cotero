class AddPedidoToItemPedidos < ActiveRecord::Migration
  def change
    change_table :item_pedidos do |t|
      t.references :pedido, index: true, foreign_key: true
    end
  end
end
