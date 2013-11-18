class RenameFullnameToNameForUser < ActiveRecord::Migration
  def self.up
    rename_column :users, :fullname, :name
  end

  def self.down
    rename_column :users, :name, :fullname
  end
end
