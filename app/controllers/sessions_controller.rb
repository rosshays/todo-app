class SessionsController < ApplicationController

	def new

	end

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
