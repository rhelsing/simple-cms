class Subject < ActiveRecord::Base
	#relation
	#has_one :page #subject.page = page
	has_many :pages #subject.pages > array
	#very useful
	scope :visible, lambda {where(:visible => true)}#Subject.visible
	scope :invisible, lambda {where(:visible => false)}#Subject.invisible
	scope :sorted,  lambda {order("subjects.position ASC")}
	scope :newest_first,  lambda {order("subjects.created_at DESC")}
	scope :search, lambda {|query| where(["name LIKE ?", "%#{query}%"])}
	#can chain scopes Subject.recent.visible.active
end