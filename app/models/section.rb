class Section < ActiveRecord::Base
  belongs_to :page
  has_many :section_edits
  has_many :editors, :through => :section_edits, :class_name => "AdminUser" #way to access others with rich join

  CONTENT_TYPES = ['text', 'HTML']

  validates_presence_of :name
  validates_length_of :name, :maximum => 255, :message => "is too freaking long"
  validates_inclusion_of :content_type, :in => CONTENT_TYPES, :message => "must be one of: #{CONTENT_TYPES.join(', ')}"
  validates_presence_of :context
  
  scope :sorted,  lambda {order("sections.position ASC")}
  scope :visible, lambda {where(:visible => true)}#Subject.visible
  scope :invisible, lambda {where(:visible => false)}#Subject.invisible
  scope :newest_first,  lambda {order("sections.created_at DESC")}
end
