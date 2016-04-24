class AlertController < ApplicationController
  def index

		@alert = Workorder.order("id DESC").limit(10)

		respond_to do |format|
			format.html
			format.json { render json: @alert}
		end
  end
end
