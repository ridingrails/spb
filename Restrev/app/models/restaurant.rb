class Restaurant < ActiveRecord::Base
  attr_accessible :name, :type

  validates_presence_of :name

  has_many :ratings

  has_many :raters, :through => :ratings, :source => :rater

  def avg
    average
  end
end
