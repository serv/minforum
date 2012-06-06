class AddPreliminaryColumnsToTopic < ActiveRecord::Migration
  def change
    add_column :topics, :name, :string
  end
end
