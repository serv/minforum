class AddPreliminaryColumnsToPost < ActiveRecord::Migration
  def change
    add_column :forums, :content, :text
  end
end
