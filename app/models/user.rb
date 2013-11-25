class User < ActiveRecord::Base
	has_many :task_list_users, dependent: :destroy
	has_many :task_lists, through: :task_list_users
	# accepts_nested_attributes_for :task_lists

	attr_accessible :email, :name, :password, :password_confirmation, :remember_token
	before_create :create_remember_token
	before_save { self.email = email.downcase }

	validates :name, presence: true, length: { maximum: 50 }

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness:	{ case_sensitive: false }

	has_secure_password
	validates :password, length: { minimum: 6 }


	def User.new_remember_token
		SecureRandom.urlsafe_base64
	end

	def User.encrypt(token)
		Digest::SHA1.hexdigest(token.to_s)
	end

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

	private 
		def create_remember_token
			self.remember_token = User.encrypt(User.new_remember_token)
		end

end
