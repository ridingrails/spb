class RemakeTrueRating < ActiveRecord::Migration
  def change
    change_column :ratings, :restaurant_id, :integer, :null => false
  end
end
