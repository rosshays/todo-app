class PagesController < ApplicationController
	before_filter :signed_in_user
	
	def home
		if signed_in?
			@new_tasklist = current_user.task_lists.build
		end
	end

	def calendar
		if signed_in?
			@new_tasklist = current_user.task_lists.build
		end
	end

end
