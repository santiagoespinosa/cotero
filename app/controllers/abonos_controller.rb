class AbonosController < ApplicationController
  before_action :set_abono, only: [:show, :edit, :update, :destroy]

  # GET /abonos
  # GET /abonos.json
  def index
    @abonos = Abono.all
  end

  # GET /abonos/1
  # GET /abonos/1.json
  def show
  end

  # GET /abonos/new
  def new
    @abono = Abono.new
  end

  # GET /abonos/1/edit
  def edit
  end

  # POST /abonos
  # POST /abonos.json
  def create
    @abono = Abono.new(abono_params)

    respond_to do |format|
      if @abono.save
        format.html { redirect_to @abono, notice: 'Abono was successfully created.' }
        format.json { render :show, status: :created, location: @abono }
      else
        format.html { render :new }
        format.json { render json: @abono.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /abonos/1
  # PATCH/PUT /abonos/1.json
  def update
    respond_to do |format|
      if @abono.update(abono_params)
        format.html { redirect_to @abono, notice: 'Abono was successfully updated.' }
        format.json { render :show, status: :ok, location: @abono }
      else
        format.html { render :edit }
        format.json { render json: @abono.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /abonos/1
  # DELETE /abonos/1.json
  def destroy
    @abono.destroy
    respond_to do |format|
      format.html { redirect_to abonos_url, notice: 'Abono was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_abono
      @abono = Abono.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def abono_params
      params.require(:abono).permit(:proveedor_id, :pedido_id, :monto, :comentario, :user_id)
    end
end
