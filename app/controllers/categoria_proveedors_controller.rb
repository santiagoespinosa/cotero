class CategoriaProveedorsController < ApplicationController
  before_action :set_categoria_proveedor, only: [:show, :edit, :update, :destroy]

  # GET /categoria_proveedors
  # GET /categoria_proveedors.json
  def index
    @categoria_proveedors = CategoriaProveedor.all
  end

  # GET /categoria_proveedors/1
  # GET /categoria_proveedors/1.json
  def show
  end

  # GET /categoria_proveedors/new
  def new
    @categoria_proveedor = CategoriaProveedor.new
    @proveedors = Proveedor.all
    @categoria = Categorium.all
  end

  # GET /categoria_proveedors/1/edit
  def edit
  end

  # POST /categoria_proveedors
  # POST /categoria_proveedors.json
  def create
    @categoria_proveedor = CategoriaProveedor.new(categoria_proveedor_params)

    respond_to do |format|
      if @categoria_proveedor.save
        format.html { redirect_to @categoria_proveedor, notice: 'Categoria proveedor was successfully created.' }
        format.json { render :show, status: :created, location: @categoria_proveedor }
      else
        format.html { render :new }
        format.json { render json: @categoria_proveedor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categoria_proveedors/1
  # PATCH/PUT /categoria_proveedors/1.json
  def update
    respond_to do |format|
      if @categoria_proveedor.update(categoria_proveedor_params)
        format.html { redirect_to @categoria_proveedor, notice: 'Categoria proveedor was successfully updated.' }
        format.json { render :show, status: :ok, location: @categoria_proveedor }
      else
        format.html { render :edit }
        format.json { render json: @categoria_proveedor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categoria_proveedors/1
  # DELETE /categoria_proveedors/1.json
  def destroy
    @categoria_proveedor.destroy
    respond_to do |format|
      format.html { redirect_to categoria_proveedors_url, notice: 'Categoria proveedor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_categoria_proveedor
      @categoria_proveedor = CategoriaProveedor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def categoria_proveedor_params
      params.require(:categoria_proveedor).permit(:proveedor_id, :categorium_id)
    end
end
