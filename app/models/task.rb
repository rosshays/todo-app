class Task < ActiveRecord::Base
  attr_accessible :duedate, :task, :task_list_id
  belongs_to :task_list
end
