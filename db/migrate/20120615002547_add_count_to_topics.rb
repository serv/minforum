class AddCountToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :views, :integer
  end
end
