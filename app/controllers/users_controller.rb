class UsersController < ApplicationController

	def new
		@user = User.new if @user.nil?
	end

	#Creating a new account
	def create
		@user = User.new(params[:user])
		if @user.save
			sign_in @user
			flash[:success] = "Thank you for registering!"
			redirect_to root_path
		else
			render 'new'
		end
	end

	def update
		@user = User.find(params[:id])
		@user.update_attributes(params[:user])
		if @user.save
			redirect_to root_path
			flash[:success] = "Profile updated"
		else
			render 'show'
		end
	end

	def show
		@user = current_user
	end

end
