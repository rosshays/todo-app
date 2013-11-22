class RenameTasklistIdToTaskListIdForTasks < ActiveRecord::Migration
  def up
  	rename_column :tasks, :tasklist_id, :task_list_id
  end

  def down
  	rename_column :tasks, :task_list_id, :tasklist_id
  end
end
