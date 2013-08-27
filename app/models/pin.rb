class Pin < ActiveRecord::Base
  attr_accessible :description, :image

  #this must appear before validations
  has_attached_file :image, styles: { medium: "320x240>"}

  #must have a description
  validates :description, presence: true, length: { maximum: 120 }
  validates :user_id, presence: true
  validates_attachment :image, presence: true,
  														 content_type: { content_type: ['image/jpeg', 'image/jpg', 'image/png', 'image/gif' ] },
  														 size: { less_than: 5.megabytes }


  #relationship between user and pin
  belongs_to :user


end
