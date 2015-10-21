class HomeController < ApplicationController
	def index
		@posts = Post.all
		if @posts.present?
			flash[:notice] = "All Posts"
		else
			flash[:alert] = "No posts to show"
		end
	end

	def show 
		@posts = Post.find(params[:user_id])
	end

end
