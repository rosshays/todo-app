class PagesController < ApplicationController

	def home
		@user = current_user
		@taskslists = {}
		@user.task_list_users.each do |list_user|
			@taskslists << list_user.task_list
		end
	end

end
