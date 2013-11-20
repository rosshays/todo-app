class PagesController < ApplicationController

	def home
		if signed_in?
			@user = current_user
			@taskslists = []
			@user.task_list_users.each do |list_user|
				@taskslists << list_user.task_list
			end

			@new_tasklist = current_user.task_lists.build
			current_user.save
		end
	end

end
