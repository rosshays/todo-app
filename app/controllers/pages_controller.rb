class PagesController < ApplicationController

	#This will get the users lists if they are currently signed in
	def home
		if signed_in?
			@new_tasklist = current_user.task_lists.build
		end
	end

	#Does the same thing for calendar
	def calendar
		if signed_in?
			@new_tasklist = current_user.task_lists.build
		end
	end

end
