class WelcomeController < ApplicationController
  def index

		if session[:user_id]

			user = User.find(session[:user_id])

			if user.setting
				@wait_time = user.setting.wait_time * 1000
			else
				@wait_time = 10 * 1000
			end

			format.html { render :dashboard}
		end
  end
end
