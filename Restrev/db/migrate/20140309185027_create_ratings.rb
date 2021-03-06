class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :user_id, :null => false
      t.integer :restaurant_id, :null => false
      t.integer :stars, :null => false
      t.text :comment

      t.timestamps
    end
    add_index :ratings, [:user_id, :restaurant_id], :unique => true
  end
end
