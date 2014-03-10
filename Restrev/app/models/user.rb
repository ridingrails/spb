class User < ActiveRecord::Base
  attr_accessible :name, :email

  validates_presence_of :name, :email

  has_many :ratings

  has_many :rateds, :through => :ratings, :source => :rated

  def num_rated
    Rating.where(:user_id => self.id).count
  end
end
