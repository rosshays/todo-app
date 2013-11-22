class TaskList < ActiveRecord::Base
  attr_accessible :name
  has_many :tasks, dependent: :destroy
  
  has_many :task_list_users, dependent: :destroy
  has_many :users, through: :task_list_users
  accepts_nested_attributes_for :users
end
