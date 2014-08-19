class AdminUser < ActiveRecord::Base
	#self.table_name = "admin_users"#configuration because against convention if user
	has_and_belongs_to_many :pages #can edit pages that others can edit too
	#adds code for each column in table
	has_many :section_edits
	has_many :sections, :through => :section_edits
end
