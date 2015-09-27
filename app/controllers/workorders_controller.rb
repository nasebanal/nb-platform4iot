class WorkordersController < ApplicationController
  before_action :set_workorder, only: [:show, :edit, :update, :destroy]
	helper_method :get_class, :get_status, :get_proc_mode

  # GET /workorders
  # GET /workorders.json
  def index
    @workorders = Workorder.order("id DESC")
  end

  # GET /workorders/1
  # GET /workorders/1.json
  def show
		@workorder = Workorder.find(params[:id])
  end

  # GET /workorders/new
  def new
    @workorder = Workorder.new
  end

  # GET /workorders/1/edit
  def edit
  end

  # POST /workorders
  # POST /workorders.json
  def create

		user = User.find(session[:user_id])
		params[:workorder][:creator] = user[:name]
		attr = params.require(:workorder).permit(:proc_mode, :data_set, :creator)

		@workorder = Workorder.new(attr)

    respond_to do |format|
      if @workorder.save
        format.html { redirect_to @workorder, notice: 'Workorder was successfully created.' }
        format.json { render :show, status: :created, location: @workorder }
      else
        format.html { render :new }
        format.json { render json: @workorder.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /workorders/1
  # PATCH/PUT /workorders/1.json
  def update
    respond_to do |format|
      if @workorder.update(workorder_params)
        format.html { redirect_to @workorder, notice: 'Workorder was successfully updated.' }
        format.json { render :show, status: :ok, location: @workorder }
      else
        format.html { render :edit }
        format.json { render json: @workorder.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /workorders/1
  # DELETE /workorders/1.json
  def destroy
    @workorder.destroy
    respond_to do |format|
      format.html { redirect_to workorders_url, notice: 'Workorder was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

		def get_class (status)

			case status

				when 1 then
					return "success"
				when 2 then
					return "danger"

			end
		end

		def get_proc_mode (proc_mode)

			case proc_mode

				when 0 then
					return "L0"
				when 1 then
					return "L1"
				when 2 then
					return "L2"

			end
		end

		def get_status (status)

			case status

				when 0 then
					return "WAITING"
				when 1 then
					return "SUCCESS"
				when 2 then
					return "ERROR"

			end
		end

    # Use callbacks to share common setup or constraints between actions.
    def set_workorder
      @workorder = Workorder.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def workorder_params
      params[:workorder]
    end
end
