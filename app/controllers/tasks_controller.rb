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
		if task.save
			respond_to do |format|
				format.html { redirect_to root_path }
				format.json 
			end
		else
			# return an error here accordingly
		end
	end

	def destroy
	end

end