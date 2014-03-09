class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name, :null => false
      t.string :type

      t.timestamps
    end
  end
end
