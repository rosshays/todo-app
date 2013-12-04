class User < ActiveRecord::Base
	#task_list_users - M:M relationship with task_lists
	#task_lists - See #task_list_users
	has_many :task_list_users, dependent: :destroy
	has_many :task_lists, through: :task_list_users
	# accepts_nested_attributes_for :task_lists

	#email - Email associated with User
	#password - Password for the user (when creating account)
	#password_confirmation - Same as password
	#remember_toekn - Used for cookies/login sessions, keeps the user logged in even after browser is closed
	attr_accessible :email, :name, :password, :password_confirmation, :remember_token
	before_create :create_remember_token
	before_save { self.email = email.downcase }

	#Makes sure the user enters a names
	validates :name, presence: true, length: { maximum: 50 }

	#Makes sure the user enters a valid email address
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness:	{ case_sensitive: false }

	#Makes sure the user enters a password of miniumum 6 characters
	has_secure_password
	validates :password, length: { minimum: 6 }

	#Cookie creation for a user, password authentication
	def User.new_remember_token
		SecureRandom.urlsafe_base64
	end

	#Encryption of password
	def User.encrypt(token)
		Digest::SHA1.hexdigest(token.to_s)
	end

	#Used for printing out the tasks with dates inside of the calendar
	def getTasks
		arr = [] 
		self.task_lists.each do |list| 
			list.tasks.each do |task| 
				if task.has_due_date
					yield task if block_given?				
					arr << task
				end
			end 
		end
		return arr
	end

	#Creating the cookie
	private 
		def create_remember_token
			self.remember_token = User.encrypt(User.new_remember_token)
		end

end
