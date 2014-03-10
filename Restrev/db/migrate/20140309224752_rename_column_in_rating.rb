class RenameColumnInRating < ActiveRecord::Migration
  def change
    rename_column :ratings, :comment, :details
  end
end
