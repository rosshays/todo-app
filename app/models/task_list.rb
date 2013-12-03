class TaskList < ActiveRecord::Base

#name - The name of the task list
#tasks - The tasks associated to the task list
#task_list_users - The M:M relationship between users and task lists
#users - see task_list_users

  attr_accessible :name
  has_many :tasks, dependent: :destroy
  
  has_many :task_list_users, dependent: :destroy
  has_many :users, through: :task_list_users
  accepts_nested_attributes_for :users
end
