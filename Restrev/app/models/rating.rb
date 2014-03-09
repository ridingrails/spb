class Rating < ActiveRecord::Base
  attr_accessible :user_id, :restaurant_id, :stars, :comment

  validates_presence_of :user_id, :restaurant_id, :stars, :comment

  validates :stars, :inclusion => 1..5

  belongs_to(
      :rater,
      :primary_key => :id,
      :foreign_key => :user_id,
      :class_name => "User"

  belongs_to(
      :rated,
      :primary_key => :id,
      :foreign_key => :restaurant_id,
      :class_name => "Restaurant"


end
