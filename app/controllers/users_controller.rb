class UsersController < ApplicationController

	def new
		@user = User.new if @user.nil?
	end

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

	def show
	
	end

end
