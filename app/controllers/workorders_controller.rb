class WorkordersController < ApplicationController
	before_action :authenticate_user!
  before_action :set_workorder, only: [:show, :edit, :update, :destroy]
	before_action :set_form, only: [:index, :new, :edit]
	helper_method :get_class, :get_status, :get_proc_mode

  # GET /workorders
  # GET /workorders.json
  def index

		#======= Get Parameters =======

		if params[:procmode_id].present?

			@procmode_id = params[:procmode_id].to_i
		else

			@procmode_id = -1
		end


		if params[:status_id].present?

			@status_id = params[:status_id].to_i
		else

			@status_id = -1
		end


		start_year = params[:start_year]
		start_month = params[:start_month]
		start_day = params[:start_day]
		start_hour = params[:start_hour]
		start_min = params[:start_min]
		start_sec = params[:start_sec]

		if start_year.present? and start_month.present? and start_day.present? and start_hour.present? and start_min.present? and start_sec.present?
			start_date = "%04d%02d%02d%02d%02d%02d" % [start_year.to_i, start_month.to_i, start_day.to_i, start_hour.to_i, start_min.to_i, start_sec.to_i]
		else
			start_date = "00000000000000"
		end


		end_year = params[:end_year]
		end_month = params[:end_month]
		end_day = params[:end_day]
		end_hour = params[:end_hour]
		end_min = params[:end_min]
		end_sec = params[:end_sec]


		if end_year.present? and end_month.present? and end_day.present? and end_hour.present? and end_min.present? and end_sec.present?
			end_date = "%04d%02d%02d%02d%02d%02d" % [end_year.to_i, end_month.to_i, end_day.to_i, end_hour.to_i, end_min.to_i, end_sec.to_i]
		else
			end_date = "99999999999999"
		end


		#======= Get WO lists =======

		if @status_id != -1 and @procmode_id != -1
	   	@workorders = Workorder.where("status_id = ? and procmode_id = ? and ? <= obstime and obstime <= ?", @status_id, @procmode_id,  start_date, end_date).order("id DESC")
		else
			@workorders = Workorder.where("? <= obstime and obstime <= ?", start_date, end_date).order("id DESC")
		end


		#======= Get Wait Time =======

		user = User.find(session[:user_id])

		if user.setting
			@wait_time = user.setting.wait_time * 1000
		else
			@wait_time = 10 * 1000
		end

		respond_to do |format|
			format.html
			format.json { render json: @workorders}
		end
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

		params[:workorder][:user_id] = session[:user_id]
		params[:workorder][:status_id] = 0
#		params[:workorder][:obstime] = Time.now.strftime('%Y%m%d%H%M%S')
		params[:workorder][:obstime] = "20150101010101"
		attr = params.require(:workorder).permit(:procmode_id, :data_set, :user_id, :status_id, :obstime)

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

		def get_class (status_id)

			case status_id

				when 2 then
					return "success"
				when 3 then
					return "danger"

			end
		end


    # Use callbacks to share common setup or constraints between actions.
    def set_workorder
      @workorder = Workorder.find(params[:id])
    end

		def set_form

			@workorders = Workorder.select(:data_set).order("data_set DESC").uniq
			@statuses = Status.select(:name, :id)
			@procmodes = Procmode.all


			#======= Get Year List =======

			time = Time.now
			@year_list = (2016..time.year).to_a
			@start_year = params[:start_year]
			@end_year = params[:end_year]

			if @end_year.nil?
				@end_year = time.year
			end


    	#======= Get Month List =======

    	@month_list = (1..12).to_a
    	@start_month = params[:start_month]
    	@end_month = params[:end_month]

			if @end_month.nil?
				@end_month = time.month
			end


    	#======= Get Day List =======

    	@day_list = (1..31).to_a
    	@start_day = params[:start_day]
    	@end_day = params[:end_day]

			if @end_day.nil?
				@end_day = time.day
			end

			#====== Get Hour List =======

			@hour_list = (0..23).to_a
			@start_hour = params[:start_hour]
			@end_hour = params[:end_hour]

			if @end_hour.nil?
				@end_hour = time.hour
			end

			#====== Get Min List =======

      @min_list = (0..59).to_a
      @start_min = params[:start_min]
      @end_min = params[:end_min]

			if @end_min.nil?
				@end_min = time.min
			end

			#====== Get Sec List =======

      @sec_list = (0..59).to_a
      @start_sec = params[:start_sec]
      @end_sec = params[:end_sec]

			if @end_sec.nil?
				@end_sec = time.sec
			end
		end

    # Never trust parameters from the scary internet, only allow the white list through.
    def workorder_params
      params[:workorder]
    end
end
