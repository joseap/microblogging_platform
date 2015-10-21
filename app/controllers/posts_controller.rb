class PostsController < ApplicationController
	def index
		@posts = Post.all
		if @posts.present?
			flash[:notice] = "All Posts"
		else
			flash[:alert] = "No posts to show"
		end
	end

	def show 
		@post = Post.find(params[:id])
	end

	# NEW POST

	def new
		@post = Post.new
	end

	def create
		Post.create(title: params[:post][:title],
		body: params[:post][:body],
		user_id: session[:user_id])

		flash[:posted] = "New post created"
		redirect_to posts_path
	end

	# EDIT POST

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])
		@post.update_attributes(params.require(:post).permit(:title, :body))
		flash[:updated] = "Post has been updated"
		redirect_to posts_path
	end

	# DESTROY POST

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		flash[:destroyed] = "Post deleted"
		redirect_to posts_path
	end
end
