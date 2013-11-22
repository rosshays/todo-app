class Task < ActiveRecord::Base
  attr_accessible :duedate, :task, :task_list_id, :has_due_date, :priority
  belongs_to :task_list
  before_save { self.priority = (self.priority.to_i - 2).to_s  }
end
