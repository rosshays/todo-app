class TaskListUser < ActiveRecord::Base
  attr_accessible :tasklist_id, :user_id
  belongs_to :user
  belongs_to :task_list
end
