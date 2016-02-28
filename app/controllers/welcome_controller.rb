class WelcomeController < ApplicationController
  def index

		if session[:user_id]

			@user = User.find(session[:user_id])

			render :dashboard
		end
  end
end
