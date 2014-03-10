class RenameColumnInRestaurant < ActiveRecord::Migration
  def change
    rename_column :restaurants, :type, :genre
  end
end
