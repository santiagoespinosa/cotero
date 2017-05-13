class ItemListaController < ApplicationController
  before_action :set_item_listum, only: [:show, :edit, :update, :destroy]

  # GET /item_lista
  # GET /item_lista.json
  def index
    @item_lista = ItemListum.all
  end

  # GET /item_lista/1
  # GET /item_lista/1.json
  def show
  end

  # GET /item_lista/new
  def new
    @item_listum = ItemListum.new
    @lista = Listum.all
    @items = Item.all
  end

  # GET /item_lista/1/edit
  def edit
  end

  # POST /item_lista
  # POST /item_lista.json
  def create
    @item_listum = ItemListum.new(item_listum_params)

    respond_to do |format|
      if @item_listum.save
        format.html { redirect_to @item_listum, notice: 'Item listum was successfully created.' }
        format.json { render :show, status: :created, location: @item_listum }
      else
        format.html { render :new }
        format.json { render json: @item_listum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /item_lista/1
  # PATCH/PUT /item_lista/1.json
  def update
    respond_to do |format|
      if @item_listum.update(item_listum_params)
        format.html { redirect_to @item_listum, notice: 'Item listum was successfully updated.' }
        format.json { render :show, status: :ok, location: @item_listum }
      else
        format.html { render :edit }
        format.json { render json: @item_listum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /item_lista/1
  # DELETE /item_lista/1.json
  def destroy
    @item_listum.destroy
    respond_to do |format|
      format.html { redirect_to item_lista_url, notice: 'Item listum was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item_listum
      @item_listum = ItemListum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_listum_params
      params.require(:item_listum).permit(:item_id, :listum_id)
    end
end
