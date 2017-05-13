class RestaurantesController < ApplicationController
  before_action :set_restaurante, only: [:show, :edit, :update, :destroy]

  # GET /restaurantes
  # GET /restaurantes.json
  def index
    if current_user.rol == ADMIN
      @restaurantes = Restaurante.all
      #@users = User.where(:id => @users.id)
    elsif current_user.rol == RESTAURANTE
      @restaurantes = Restaurante.where(:id => Restaurante.find_by_user_id(current_user.id).id)
    else
        redirect_to '/items'
    end
  end

  # GET /restaurantes/1
  # GET /restaurantes/1.json
  def show
    if current_user.rol == ADMIN
    else
      redirect_to '/items'
    end
  end

  # GET /restaurantes/new
  def new
    if current_user.rol == ADMIN
      @restaurante = Restaurante.new
      @restaurantes = User.where(:rol => 3)
    else
      redirect_to '/items'
    end

  end

  # GET /restaurantes/1/edit
  def edit
    if current_user.rol == ADMIN
      @restaurantes = User.where(:rol => 3)
    else
      redirect_to '/items'
    end
  end

  # POST /restaurantes
  # POST /restaurantes.json
  def create
    @restaurante = Restaurante.new(restaurante_params)

    respond_to do |format|
      if @restaurante.save
        format.html { redirect_to @restaurante, notice: 'Restaurante was successfully created.' }
        format.json { render :show, status: :created, location: @restaurante }
      else
        format.html { render :new }
        format.json { render json: @restaurante.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /restaurantes/1
  # PATCH/PUT /restaurantes/1.json
  def update
    respond_to do |format|
      if @restaurante.update(restaurante_params)
        format.html { redirect_to @restaurante, notice: 'Restaurante was successfully updated.' }
        format.json { render :show, status: :ok, location: @restaurante }
      else
        format.html { render :edit }
        format.json { render json: @restaurante.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /restaurantes/1
  # DELETE /restaurantes/1.json
  def destroy
    @restaurante.destroy
    respond_to do |format|
      format.html { redirect_to restaurantes_url, notice: 'Restaurante was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_restaurante
      @restaurante = Restaurante.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def restaurante_params
      params.require(:restaurante).permit(:nombre, :user_id)
    end
end
