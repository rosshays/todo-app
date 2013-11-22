class ChangePriorityInTasks < ActiveRecord::Migration
  def up
  	change_column :tasks, :priority, :integer
  end

  def down
  	change_column :tasks, :priority, :string
  end
end
