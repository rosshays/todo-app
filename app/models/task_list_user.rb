class TaskListUser < ActiveRecord::Base
  attr_accessible :permissions, :tasklist_id, :user_id
  belongs_to :user
end
