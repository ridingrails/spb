class Restaurant < ActiveRecord::Base
  attr_accessible :name, :genre

  validates_presence_of :name

  has_many :ratings

  has_many :raters, :through => :ratings, :source => :rater

  def avg
    self_ratings = Rating.where(:restaurant_id => self.id)
    self_ratings.average(:stars) || 3.to_f
  end

  def review_count
    Rating.where(:restaurant_id => self.id).count || 0
  end
end
