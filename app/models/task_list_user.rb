class TaskListUser < ActiveRecord::Base
  attr_accessible :task_list_id, :user_id
  belongs_to :user
  belongs_to :task_list
end
