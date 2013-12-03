class TaskListUsersController < ApplicationController

	#This function will share a list
	def share
		task_list_user = TaskListUser.new
		user = User.find_by_email(params[:email])
		list = TaskList.find(params[:tasklist_id])
		task_list_user.user_id = user.id
		task_list_user.task_list_id = list.id
		if task_list_user.save
			redirect_to root_path, flash: {action:  "Task List Shared"}
		else
			render "pages/home"
		end
	end

	def unshare

	end


end
