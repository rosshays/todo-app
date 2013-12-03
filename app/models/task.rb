class Task < ActiveRecord::Base
#duedate - A date object that contains the due date for the task
#task - Contains the actual task
#task_list_id - ID for the task list
#has_due_date - This is a boolean, used particularly for printing out on the calendar, due this week sections, and the form submission.
#task_list - Which task list this Task belongs to

  attr_accessible :duedate, :task, :task_list_id, :has_due_date
  belongs_to :task_list


#This function is for the simple_calendar gem
  def start_time
  	return duedate
  end
  
end
