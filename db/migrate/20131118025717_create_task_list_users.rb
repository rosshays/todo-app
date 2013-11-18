class CreateTaskListUsers < ActiveRecord::Migration
  def change
    create_table :task_list_users do |t|
      t.integer :user_id
      t.integer :tasklist_id
      t.integer :permissions

      t.timestamps
    end
  end
end
