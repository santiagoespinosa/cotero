class CategoriaController < ApplicationController
  before_action :set_categorium, only: [:show, :edit, :update, :destroy]

  # GET /categoria
  # GET /categoria.json
  def index
    if current_user.rol == ADMIN || current_user.rol == RESTAURANTE
      @categoria = Categorium.all
    else
      redirect_to '/items'
    end

  end

  # GET /categoria/1
  # GET /categoria/1.json
  def show
    if current_user.rol == ADMIN
    else
      redirect_to '/items'
    end
  end

  # GET /categoria/new
  def new
    if current_user.rol == ADMIN
      @categorium = Categorium.new
      @proveedors = Proveedor.all
    else
      redirect_to '/items'
    end
  end

  # GET /categoria/1/edit
  def edit
    if current_user.rol == ADMIN
      @proveedors = Proveedor.all
    else
      redirect_to '/items'
    end
  end

  # POST /categoria
  # POST /categoria.json
  def create
    @categorium = Categorium.new(categorium_params)

    respond_to do |format|
      if @categorium.save
        format.html { redirect_to @categorium, notice: 'Categorium was successfully created.' }
        format.json { render :show, status: :created, location: @categorium }
      else
        format.html { render :new }
        format.json { render json: @categorium.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categoria/1
  # PATCH/PUT /categoria/1.json
  def update
    respond_to do |format|
      if @categorium.update(categorium_params)
        format.html { redirect_to @categorium, notice: 'Categorium was successfully updated.' }
        format.json { render :show, status: :ok, location: @categorium }
      else
        format.html { render :edit }
        format.json { render json: @categorium.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categoria/1
  # DELETE /categoria/1.json
  def destroy
    @categorium.destroy
    respond_to do |format|
      format.html { redirect_to categoria_url, notice: 'Categorium was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_categorium
      @categorium = Categorium.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def categorium_params
      params.require(:categorium).permit(:nombre, :proveedor_id)
    end
end
