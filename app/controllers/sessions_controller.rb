class SessionsController < ApplicationController
	def new
	end

	def create
		@user = User.find_by(email: params[:email])
		if @user && @user.password == params[:password]
			session[:user_id] = @user.id
			flash[:loggedin] = "You're now logged in"
			redirect_to home_main_path
		else
			flash.now.alert = "Invalid email or password"
			render "new"
		end
	end

	def destroy
		session[:user_id] = nil
		flash[:loggedout] = "You've been logged out"
		redirect_to home_path
	end
end
