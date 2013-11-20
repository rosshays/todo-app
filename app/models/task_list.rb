class TaskList < ActiveRecord::Base
  attr_accessible :name
  has_many :tasks, dependent: :destroy
  belongs_to :task_list_user
end
