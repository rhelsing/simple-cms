class Page < ActiveRecord::Base
  belongs_to :subject
  has_many :sections, :dependent => :destroy
  has_and_belongs_to_many :editors, :class_name => "AdminUser" #can be edited by multiple admins

  acts_as_list :scope => :subject

  before_validation :add_default_permalink
  after_save :touch_subject
  #after_destroy :delete_related_sections #cascading delete, must build method
    #more custom than: has_many :sections, :dependent => :destroy

  validates_presence_of :name
  validates_length_of :name, :maximum => 255, :message => "is too freaking long"
  validates_presence_of :permalink
  validates_length_of :permalink, :maximum => 255, :message => "is too freaking long"
  validates_uniqueness_of :permalink

  scope :sorted,  lambda {order("pages.position ASC")}
  scope :visible, lambda {where(:visible => true)}#Subject.visible
  scope :invisible, lambda {where(:visible => false)}#Subject.invisible
  scope :newest_first,  lambda {order("pages.created_at DESC")}

  private

  def add_default_permalink
    if permalink.blank?
      self.permalink = "#{id}-#{name.parameterize}" #use self when assigning inside model
    end
  end

  def touch_subject
    #update timestamp of subject
    subject.touch
  end
end
