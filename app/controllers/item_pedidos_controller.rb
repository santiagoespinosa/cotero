class ItemPedidosController < ApplicationController
  before_action :set_item_pedido, only: [:show, :edit, :update, :destroy]

  # GET /item_pedidos
  # GET /item_pedidos.json
  def index
    if current_user.rol == ADMIN || current_user.rol == OPERARIO
    @item_pedidos = ItemPedido.all
    else
      redirect_to '/items'
    end

  end

  # GET /item_pedidos/1
  # GET /item_pedidos/1.json
  def show
    if current_user.rol == ADMIN || current_user.rol == OPERARIO
    else
      redirect_to '/items'
    end
  end

  # GET /item_pedidos/new
  def new
    if current_user.rol == ADMIN
    @item_pedido = ItemPedido.new
    else
      redirect_to '/items'
    end

  end

  # GET /item_pedidos/1/edit
  def edit
    if current_user.rol == ADMIN || current_user.rol == OPERARIO
      # @pedidos = Pedido.where(:restaurante_id => Restaurante.find_by_user_id(current_user.id).id)
      @c_proveedors = CategoriaProveedor.where(:categorium_id => @item_pedido.item.categorium_id)
      #TODO Revisar HTML que aparezca proveedor actual del item
    elsif current_user.rol == PROVEEDOR
    else
      redirect_to '/items'

    end
  end

  # POST /item_pedidos
  # POST /item_pedidos.json
  def create
    @item_pedido = ItemPedido.new(item_pedido_params)

    respond_to do |format|
      if @item_pedido.save
        format.html { redirect_to @item_pedido, notice: 'Item pedido was successfully created.' }
        format.json { render :show, status: :created, location: @item_pedido }
      else
        format.html { render :new }
        format.json { render json: @item_pedido.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /item_pedidos/1
  # PATCH/PUT /item_pedidos/1.json
  def update
    respond_to do |format|
      if @item_pedido.update(item_pedido_params)
        format.html { redirect_to '/items', notice: 'Item pedido was successfully updated.' }
        format.json { render :show, status: :ok, location: @item_pedido }
      else
        format.html { render :edit }
        format.json { render json: @item_pedido.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /item_pedidos/1
  # DELETE /item_pedidos/1.json
  def destroy
    @item_pedido.destroy
    respond_to do |format|
      format.html { redirect_to item_pedidos_url, notice: 'Item pedido was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item_pedido
      @item_pedido = ItemPedido.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_pedido_params
      params.require(:item_pedido).permit(:nombre, :valor, :disponible, :proveedor_id, :cantidad, :item_id, :estado_actual)
    end
end
