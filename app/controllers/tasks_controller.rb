class TasksController < ApplicationController

	def create
		@task = Task.new(params[:task])
		if @task.save
			redirect_to root_path
		else
			render "pages/home"
		end
	end

	def toggle
		task = Task.find(params[:task_id])
		task.finished = !task.finished
		task.save
		redirect_to root_path
	end

	def destroy
	end

end