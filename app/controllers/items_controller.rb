class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  # GET /items
  # GET /items.json
  def index
    #if current_user.rol == ADMIN
      @items = Item.all
    #elsif current_user.rol == PROVEEDOR
      #@items = Items.where(:id => Proveedor.find_by_categorium_id(current_user.id).id)

    #end
  end

  # GET /items/1
  # GET /items/1.json
  def show
    if current_user.rol == ADMIN || current_user.rol == OPERARIO || current_user.rol == RESTAURANTE
    else
      redirect_to '/items'
    end
  end

  # GET /items/new
  def new
    if current_user.rol == ADMIN
      @item = Item.new
      @categorias = Categorium.all
    else
      redirect_to '/items'
    end


  end

  # GET /items/1/edit
  def edit
    if current_user.rol == ADMIN
      @categorias = Categorium.all
    else
      redirect_to '/items'
    end

  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(item_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def user_info
  end

  def all_users
    if current_user.rol == ADMIN || current_user.rol == OPERARIO
      @usuarios = User.all
    else
      redirect_to '/user_info'
    end
  end

  def change_password
    if current_user.rol == ADMIN
      @usuario = User.find(params[:user_id])
    else
      redirect_to '/user_info'
    end

  end
  def new_change_password
    if current_user.rol == ADMIN
      user = User.find(params[:user_id])
      user.password = params[:password]
      user.password_confirmation = params[:password_confirmation]
      user.email = params[:email]
      user.save
      redirect_to '/all_users'
    else
      redirect_to '/user_info'
    end
  end

  def new_user

  end

  def create_new_user
    if current_user.rol == ADMIN
      newuser = User.new
      newuser.email = params[:email]
      newuser.password = params[:password]
      newuser.password_confirmation = params[:password_confirmation]
      newuser.celular = params[:celular]
      newuser.rol = params[:rol]
      newuser.save

      redirect_to '/all_users'
    else
      redirect_to '/user_info'
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:nombre, :categorium_id)
    end
end
