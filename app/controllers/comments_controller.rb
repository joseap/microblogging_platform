class CommentsController < ApplicationController
	def index
		@comment = Comment.all
		if @comment.present?
			flash[:notice] = "All Comments"
		else
			flash[:alert] = "No comments to display"
		end
	end

	def show 
		@comment = Comment.find(params[:id])
	end

	def new
		@comment = Comment.new
	end

	def create
		Comment.create(body: params[:comment][:body],
		user_id: session[:user_id])
		redirect_to posts_path
	end

	private
	def comment_params
      params.require(:comment).permit(:body)
    end

	def edit 
		@comment = Comment.find(params[:id])
	end

	def update 
		@comment = Comment.find(params[:id])
		@comment.update_attributes(params.require(:comment).permit(:body))
		redirect_to posts_path
	end

	def destroy
		@comment = Comment.find(params[:id])
		@comment.destroy
		redirect_to posts_path
	end
end
