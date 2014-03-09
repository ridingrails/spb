class Restaurant < ActiveRecord::Base
  attr_accessible :name, :type

  validates_presence_of :name

  has_many :ratings

  has_many :raters, :through => :ratings, :source => :rater

  def avg
    self_ratings = Rating.where(:restaurant_id => self.id)
    self_ratings.average(:stars)
  end

  def rated_by_current
    Rating.where(:user_id => current_user.id, :restaurant_id => self.id).exists?
  end
end
