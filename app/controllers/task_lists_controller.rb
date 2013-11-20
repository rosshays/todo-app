class TaskListsController < ApplicationController

	def create
		@task_list = current_user.task_lists.build(params[:task_list])
		if @task_list.save
			redirect_to root_path
		else
			render "pages/home"
		end
	end

	def destroy
	end

end
