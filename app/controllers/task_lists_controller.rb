class TaskListsController < ApplicationController

	#Creating a new task list
	def create
		@task_list = TaskList.new(params[:task_list])
		@task_list.task_list_users.build(user_id: current_user.id)
		
		# current_user.task_lists.build(params[:task_list])
		if @task_list.save
			redirect_to root_path, flash: {action:  "Task List Added"}
		else
			render "pages/home"
		end
	end

	def destroy
		@tasks.each do |task|
			task.destroy
		end
		@task_list_users.each do |list_user|
			list_user.destroy
		end
		flash[:action] = "Task List Deleted"
	end

	# just being removed for current user
	def remove
		if params[:remove_method] == "me"
			list_user = current_user.task_list_users.find_by_task_list_id(params[:remove_list_id])
			list_user.destroy
			# if you were the only user we can remove the list
			list = TaskList.find(params[:remove_list_id])
			if list.task_list_users.empty?
				list.destroy
			end

		else
			list = TaskList.find(params[:remove_list_id])
			list.task_list_users.each do |list_user|
				if list_user.user_id == current_user.id
					list_user.destroy
				end
			end
			list.destroy
		end
		redirect_to root_path, flash: {action:  "Task List Removed"}
	end

end
