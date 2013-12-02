class UsersController < ApplicationController
	def new
		@user = User.new
	end

	#Creating a new account
	def create
		@user = User.new(params[:user])
		if @user.save
			flash[:success] = "Thank you for registering!"
			sign_in @user
			redirect_to root_path
		else
			render 'new'
		end
	end

	def show
	end

end
