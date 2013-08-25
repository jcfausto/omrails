class Pin < ActiveRecord::Base
  attr_accessible :description

  #must have a description
  validates :description, presence: true, length: { maximum: 120 }
end
