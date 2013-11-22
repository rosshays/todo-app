class RemovePermissionsFromTaskListUsers < ActiveRecord::Migration
  def up
    remove_column :task_list_users, :permissions
  end

  def down
    add_column :task_list_users, :permissions, :integer
  end
end
