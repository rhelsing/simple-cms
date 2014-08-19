class Page < ActiveRecord::Base
  belongs_to :subject
  has_many :sections
  has_and_belongs_to_many :editors, :class_name => "AdminUser" #can be edited by multiple admins

  scope :sorted,  lambda {order("pages.position ASC")}
  scope :visible, lambda {where(:visible => true)}#Subject.visible
  scope :invisible, lambda {where(:visible => false)}#Subject.invisible
  scope :newest_first,  lambda {order("pages.created_at DESC")}
end
