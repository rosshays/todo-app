class SessionsController < ApplicationController

	#When they load the page this determines if they're signed in
	def new
		if signed_in?
			redirect_to root_path
		end
	end

	#This creates a new session when a user logs in
	def create
		user = User.find_by_email(params[:session][:email].downcase)
		if user && user.authenticate(params[:session][:password])
			# login the user
			sign_in user
			redirect_to root_path
		else
			# something went wrong
			render "new"
		end
	end

	def destroy
		sign_out
    	redirect_to root_url
	end

end
