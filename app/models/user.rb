class User < ActiveRecord::Base
  attr_accessible :email, :fullname, :username
  has_many :task_list_users
end
