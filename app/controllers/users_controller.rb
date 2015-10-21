class UsersController < ApplicationController

	#ISNECRUD -> Abbrev. IND.SHOW.NEW.EDIT.CREATE.UPDATE.DESTROY

	# ====== SHOW USER INDEX ====== # 
	def index
		@users = User.all
		if @users.present?
			flash[:notice] = "All Users"
		else
			flash[:alert] = "No users"
		end
	end

	def show 
		@user = User.find(params[:id])
	end
	
	# ====== NEW USER ====== # 
	def new
		@user = User.new
	end

	def create
		@user = User.create(params.require(:user).permit(:fname, :lname, :username, :email, :password))
		  if @user.save
		  	flash[:created] = "New user created"
		    redirect_to home_main_path
		  else
		    redirect_to new_user_path
		    flash[:invalid] = "Incorrect Password or Email. Please try again"
		  end
	end

	# ====== EDIT USER ====== # 
	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		@user.update_attributes(params.require(:user).permit(:fname, :lname, :username, :email, :password))
		flash[:updated] = "User has been updated"
		redirect_to users_path
	end

	# ====== DELETE USER ====== # 
	def destroy 
		@user = User.find(params[:id])
		@user.destroy
		flash[:destroyed] = "User has been deleted"
		redirect_to users_path
	end
end
