class User < ActiveRecord::Base
  attr_accessible :name, :email

  validates_presence_of :name, :email

  has_many :ratings

  has_many :rated, :through => :ratings, :source => :rated
end
