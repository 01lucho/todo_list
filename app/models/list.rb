class List < ActiveRecord::Base
  attr_accessible :work, :check

  validates_presence_of :work

  scope :incomplete_lists, where(check: false)
  scope :complete_lists, where(check: true)

end
