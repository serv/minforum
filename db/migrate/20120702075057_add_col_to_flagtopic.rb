class AddColToFlagtopic < ActiveRecord::Migration
  def change
    add_column :flagtopics, :content, :text
  end
end
