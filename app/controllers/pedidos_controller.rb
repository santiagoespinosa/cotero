class PedidosController < ApplicationController
  before_action :set_pedido, only: [:show, :edit, :update, :destroy]

  # GET /pedidos
  # GET /pedidos.json
  def index
    if current_user.rol == ADMIN || current_user.rol == OPERARIO
      @pedidos = Pedido.all
    elsif current_user.rol == RESTAURANTE
      @pedidos = Pedido.where(:restaurante_id => Restaurante.find_by_user_id(current_user.id).id)
    elsif current_user.rol == PROVEEDOR
      @pedidos = Pedido.joins("INNER JOIN item_pedidos ON item_pedidos.pedido_id = pedidos.id").where("item_pedidos.proveedor_id = ?", Proveedor.find_by_user_id(current_user.id).id)
    end
end

  # GET /pedidos/1
  # GET /pedidos/1.json
  def show
    if current_user.rol == ADMIN || current_user.rol == OPERARIO || current_user.rol == RESTAURANTE
      @items_pedido = ItemPedido.where(:pedido_id => @pedido.id)
    elsif current_user.rol == PROVEEDOR
      @items_pedido = ItemPedido.joins("INNER JOIN pedidos ON item_pedidos.pedido_id = pedidos.id").where("item_pedidos.proveedor_id = ? AND pedidos.id = ?", Proveedor.find_by_user_id(current_user.id).id , @pedido.id)
    else
      redirect_to '/items'
    end

  end

  # GET /pedidos/new
  def new
    if current_user.rol == ADMIN || current_user.rol == RESTAURANTE
      @pedido = Pedido.new
      @listum = Listum.find(params[:listum_id])
      @items_lista = ItemListum.where(:listum_id => params[:listum_id])
      puts @items_lista
      @restaurante = Restaurante.find(Listum.find(params[:listum_id]).restaurante_id)
      @items_proveedor = ItemProveedor.where(:listum_id => params[:listum_id])
      @is_new = TRUE
    else
      redirect_to '/items'
    end

  end

  # GET /pedidos/1/edit
  def edit
    if current_user.rol == ADMIN || current_user.rol == OPERARIO
      @restaurante = Restaurante.find(@pedido.restaurante_id)
      @listum = nil
      @items_lista = ItemListum.where(:listum_id => params[:listum_id]) #TODO Revisar esto!
      @is_new = FALSE
    else
      redirect_to '/items'
    end

  end

  # POST /pedidos
  # POST /pedidos.json
  def create
    @pedido = Pedido.new(pedido_params)
    @pedido.pedido_hash = get_pedido_hash
    @pedido.estado_actual = PEDIDO_SOLICITADO

    #redirect_to '/pedidos'
    respond_to do |format|
      if @pedido.save

        params[:item_cantidad].each do |a, b|
          newitem_pedido = ItemPedido.new
          newitem_pedido.cantidad = b
          newitem_pedido.item_id = a
          item = Item.find(a)
          newitem_pedido.nombre = item.nombre
          newitem_pedido.valor = ItemProveedor.find_by_item_id_and_proveedor_id(item.id,Categorium.find(item.categorium_id).proveedor_id).precio
          newitem_pedido.pedido_id = @pedido.id
          newitem_pedido.estado_actual = ITEM_SOLICITADO
          newitem_pedido.proveedor_id = Categorium.find(item.categorium_id).proveedor_id
          newitem_pedido.disponible = true
          newitem_pedido.save

        end
        format.html { redirect_to @pedido, notice: 'Pedido was successfully created.' }
        format.json { render :show, status: :created, location: @pedido }
      else
        format.html { render :new }
        format.json { render json: @pedido.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pedidos/1
  # PATCH/PUT /pedidos/1.json
  def update
    respond_to do |format|
      if @pedido.update(pedido_params)
        format.html { redirect_to @pedido, notice: 'Pedido was successfully updated.' }
        format.json { render :show, status: :ok, location: @pedido }
      else
        format.html { render :edit }
        format.json { render json: @pedido.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pedidos/1
  # DELETE /pedidos/1.json
  def destroy
    @pedido.destroy
    respond_to do |format|
      format.html { redirect_to pedidos_url, notice: 'Pedido was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def update_estado_actual
    if current_user.rol == ADMIN
      pedido = Pedido.find(params[:pedido_id])
      pedido.estado_actual = params[:estado_actual]
      pedido.save
      redirect_to '/pedidos'

    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pedido
      @pedido = Pedido.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pedido_params
      params.require(:pedido).permit(:pedido_hash, :estado_actual, :restaurante_id, :fechahora_solicitada, :fechahora_estimada, :fee)
    end

  def get_pedido_hash
    randomness = SecureRandom.hex(3)
    while Pedido.where(:pedido_hash => randomness).count > 0
      randomness = SecureRandom.hex(3)
    end
    return randomness
  end

end
