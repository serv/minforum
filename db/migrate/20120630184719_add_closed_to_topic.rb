class AddClosedToTopic < ActiveRecord::Migration
  def change
    add_column :topics, :closed, :boolean, default: false
  end
end
