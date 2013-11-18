class Task < ActiveRecord::Base
  attr_accessible :duedate, :task
  belongs_to :task_list
end
