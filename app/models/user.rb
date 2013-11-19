# class User < ActiveRecord::Base
# 	before_save { self.email = email.downcase }
# 	validates :name, presnse: true, length: { maximum: 50}


# 	attr_accessible :email, :fullname, :username
# 	has_many :task_list_users

# 	has_secure_password
# 	validates :password, length: { minimum: 6 }
# end

class User < ActiveRecord::Base
	attr_accessible :email, :name, :password, :password_confirmation
	before_save { self.email = email.downcase }

	validates :name, presence: true, 
				   length: { maximum: 50 }

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: 	true,
			    format: 	{ with: VALID_EMAIL_REGEX },
			    uniqueness:	{ case_sensitive: false }

	has_secure_password
	validates :password, length: { minimum: 6 }
end
