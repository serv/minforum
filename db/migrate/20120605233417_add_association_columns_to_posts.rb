class AddAssociationColumnsToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :topic_id, :integer
  end
end
