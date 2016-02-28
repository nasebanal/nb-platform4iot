class ProcmodesController < ApplicationController
  before_action :set_procmode, only: [:show, :edit, :update, :destroy]

  # GET /procmodes
  # GET /procmodes.json
  def index
    @procmodes = Procmode.all
  end

  # GET /procmodes/1
  # GET /procmodes/1.json
  def show
  end

  # GET /procmodes/new
  def new
    @procmode = Procmode.new
  end

  # GET /procmodes/1/edit
  def edit
  end

  # POST /procmodes
  # POST /procmodes.json
  def create
    @procmode = Procmode.new(procmode_params)

    respond_to do |format|
      if @procmode.save
        format.html { redirect_to @procmode, notice: 'Procmode was successfully created.' }
        format.json { render :show, status: :created, location: @procmode }
      else
        format.html { render :new }
        format.json { render json: @procmode.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /procmodes/1
  # PATCH/PUT /procmodes/1.json
  def update
    respond_to do |format|
      if @procmode.update(procmode_params)
        format.html { redirect_to @procmode, notice: 'Procmode was successfully updated.' }
        format.json { render :show, status: :ok, location: @procmode }
      else
        format.html { render :edit }
        format.json { render json: @procmode.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /procmodes/1
  # DELETE /procmodes/1.json
  def destroy
    @procmode.destroy
    respond_to do |format|
      format.html { redirect_to procmodes_url, notice: 'Procmode was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_procmode
      @procmode = Procmode.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def procmode_params
      params.require(:procmode).permit(:name)
    end
end
