class AddHasDueDateToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :has_due_date, :boolean
  end
end
