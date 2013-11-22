class RenameTasklistIdToTaskListIdForTaskListUsers < ActiveRecord::Migration
  def up
  	rename_column :task_list_users, :tasklist_id, :task_list_id
  end

  def down
  	rename_column :task_list_users, :task_list_id, :tasklist_id
  end
end
