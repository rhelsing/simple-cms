class AdminUser < ActiveRecord::Base

	has_secure_password #attr:password authenticate(password)
	#self.table_name = "admin_users"#configuration because against convention if user
	has_and_belongs_to_many :pages #can edit pages that others can edit too
	#adds code for each column in table
	has_many :section_edits
	has_many :sections, :through => :section_edits

	EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i
	validates_presence_of :first_name
	validates_length_of :first_name, :maximum => 25
	validates_presence_of :last_name
	validates_length_of :last_name, :maximum => 50
	validates_presence_of :username
	validates_length_of :username, :within => 8..25
	validates_uniqueness_of :username

	#sexy validation

	validates :email, 
		:presence => true, 
		:length => {:maximum => 100}, 
		:format => EMAIL_REGEX, 
		:confirmation => true

	validate :no_new_users_on_saturday, :on => :create #only on create
	def no_new_users_on_saturday
		if Time.now.wday == 6
			#errors.add(:username, "has been determined to fail.. always.")#add error to attribute
			errors[:base] << "No new users on Saturdays!"
		end
	end

end
