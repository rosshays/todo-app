class Task < ActiveRecord::Base
  attr_accessible :duedate, :task, :task_list_id, :has_due_date
  belongs_to :task_list

  def start_time
  	return duedate
  end
  
end
