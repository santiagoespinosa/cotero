class ItemProveedorsController < ApplicationController
  before_action :set_item_proveedor, only: [:show, :edit, :update, :destroy]

  # GET /item_proveedors
  # GET /item_proveedors.json
  def index
    if current_user.rol == ADMIN || current_user.rol == OPERARIO
      @item_proveedors = ItemProveedor.all
    elsif current_user.rol == PROVEEDOR
      @item_proveedors = ItemProveedor.where(:proveedor_id => Proveedor.find_by_user_id(current_user.id).id)
    else
      redirect_to '/items'
    end
  end

  # GET /item_proveedors/1
  # GET /item_proveedors/1.json
  def show
    if current_user.rol == ADMIN || current_user.rol == OPERARIO
    else
      redirect_to '/items'
    end
  end

  # GET /item_proveedors/new
  def new
    if current_user.rol == ADMIN
      @item_proveedor = ItemProveedor.new
      @items = Item.all
      @proveedors = Proveedor.all
    else
      redirect_to '/items'
    end

  end

  # GET /item_proveedors/1/edit
  def edit
    if current_user.rol == ADMIN
      @items = Item.all
      @proveedors = Proveedor.all
    else
      redirect_to '/items'
    end


  end

  # POST /item_proveedors
  # POST /item_proveedors.json
  def create
    @item_proveedor = ItemProveedor.new(item_proveedor_params)

    respond_to do |format|
      if @item_proveedor.save
        format.html { redirect_to @item_proveedor, notice: 'Item proveedor was successfully created.' }
        format.json { render :show, status: :created, location: @item_proveedor }
      else
        format.html { render :new }
        format.json { render json: @item_proveedor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /item_proveedors/1
  # PATCH/PUT /item_proveedors/1.json
  def update
    respond_to do |format|
      if @item_proveedor.update(item_proveedor_params)
        format.html { redirect_to @item_proveedor, notice: 'Item proveedor was successfully updated.' }
        format.json { render :show, status: :ok, location: @item_proveedor }
      else
        format.html { render :edit }
        format.json { render json: @item_proveedor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /item_proveedors/1
  # DELETE /item_proveedors/1.json
  def destroy
    @item_proveedor.destroy
    respond_to do |format|
      format.html { redirect_to item_proveedors_url, notice: 'Item proveedor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item_proveedor
      @item_proveedor = ItemProveedor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_proveedor_params
      params.require(:item_proveedor).permit(:item_id, :proveedor_id, :precio)
    end
end
