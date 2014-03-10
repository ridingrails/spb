class NullTrueRating < ActiveRecord::Migration
  def change
    change_column :ratings, :restaurant_id, :integer, :null => true
  end
end
