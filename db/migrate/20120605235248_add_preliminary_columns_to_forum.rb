class AddPreliminaryColumnsToForum < ActiveRecord::Migration
  def change
    add_column :forums, :name, :string
    add_column :forums, :description, :text
  end
end
