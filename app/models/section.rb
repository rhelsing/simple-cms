class Section < ActiveRecord::Base
  belongs_to :page
  has_many :section_edits
  has_many :editors, :through => :section_edits, :class_name => "AdminUser" #way to access others with rich join

  scope :sorted,  lambda {order("sections.position ASC")}
  scope :visible, lambda {where(:visible => true)}#Subject.visible
  scope :invisible, lambda {where(:visible => false)}#Subject.invisible
  scope :newest_first,  lambda {order("sections.created_at DESC")}
end
