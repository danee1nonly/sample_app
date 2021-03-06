class Location < ActiveRecord::Base
  has_many :microposts, :dependent => :destroy
  attr_accessible :name, :location_id, :user_id
  validates :name, :presence => true, :length => {:maximum => 50}

end
