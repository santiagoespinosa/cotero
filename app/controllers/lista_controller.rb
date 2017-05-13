class ListaController < ApplicationController
  before_action :set_listum, only: [:show, :edit, :update, :destroy]

  # GET /lista
  # GET /lista.json
  def index
    if current_user.rol == ADMIN
      @lista = Listum.all
    elsif current_user.rol == RESTAURANTE
      @lista = Listum.where(:restaurante_id => Restaurante.find_by_user_id(current_user.id).id)
    end
  end

  # GET /lista/1
  # GET /lista/1.json
  def show
    if current_user.rol == ADMIN
      puts @listum.id
       @items_lista = ItemListum.where(:listum_id => @listum.id) #ItemListum.where('listum_id = ?', @listum.id)
    elsif current_user.rol == RESTAURANTE
      @items_lista = ItemListum.where(:listum_id => Restaurante.find_by_user_id(current_user.id).id)
    else
      redirect_to '/user_info'
    end

  end

  # GET /lista/new
  def new
    if current_user.rol == ADMIN || current_user.rol == RESTAURANTE
      @listum = Listum.new
      @restaurantes = Restaurante.all
      @items = Item.all.order('categorium_id')
    else
      redirect_to '/user_info'
    end

  end

  # GET /lista/1/edit
  def edit
    if current_user.rol == ADMIN
      @restaurantes = Restaurante.all
      @items = Item.all.order('categorium_id')
      else redirect_to '/user_info'
      end
  end

  # POST /lista
  # POST /lista.json
  def create

    @listum = Listum.new(listum_params)
    if current_user.rol == RESTAURANTE
      @listum.restaurante_id = Restaurante.find_by_user_id(current_user.id).id
    end
    respond_to do |format|
      if @listum.save
        params[:listum_items].each do |a, b|
          newitemlista = ItemListum.new
          newitemlista.item_id = a
          newitemlista.listum_id = @listum.id
          newitemlista.save
        end
        format.html { redirect_to '/lista', notice: 'Listum was successfully created.' }
        format.json { render :show, status: :created, location: @listum }
      else
        format.html { render :new }
        format.json { render json: @listum.errors, status: :unprocessable_entity }
      end
    end



  end

  # PATCH/PUT /lista/1
  # PATCH/PUT /lista/1.json
  def update
    respond_to do |format|
      if @listum.update(listum_params)
        format.html { redirect_to @listum, notice: 'Listum was successfully updated.' }
        format.json { render :show, status: :ok, location: @listum }
      else
        format.html { render :edit }
        format.json { render json: @listum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lista/1
  # DELETE /lista/1.json
  def destroy
    @listum.destroy
    respond_to do |format|
      format.html { redirect_to lista_url, notice: 'Listum was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_listum
      @listum = Listum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def listum_params
      params.require(:listum).permit(:nombre, :restaurante_id)
    end
end
