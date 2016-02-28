class WelcomeController < ApplicationController
  def index

		if session[:user_id]

			user = User.find(session[:user_id])

			if user.setting
				@wait_time = user.setting.wait_time
			else
				@wait_time = 10
			end

			render :dashboard
		end
  end
end
