class User < ActiveRecord::Base
  attr_accessible :email, :fullname, :username
end
