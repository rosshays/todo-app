class TasksController < ApplicationController

	def create
		@task = Task.new(params[:task])
		if @task.save
			redirect_to root_path
		else
			render "pages/home"
		end
	end

	def destroy
	end

end