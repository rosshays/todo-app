class TaskListsController < ApplicationController

	def create
		@task_list = TaskList.new(params[:task_list])
		@task_list.task_list_users.build(user_id: current_user.id)
		
		# current_user.task_lists.build(params[:task_list])
		if @task_list.save!
			redirect_to root_path
		else
			render "pages/home"
		end
	end

	def destroy
	end

end
