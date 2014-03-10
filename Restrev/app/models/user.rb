class User < ActiveRecord::Base
  attr_accessible :name, :email

  validates_presence_of :name, :email
  validates_format_of :email,
   :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create

  has_many :ratings

  has_many :rateds, :through => :ratings, :source => :rated

  def num_rated
    Rating.where(:user_id => self.id).count
  end
end
