class CreateFlagposts < ActiveRecord::Migration
  def change
    create_table :flagposts do |t|
      t.integer :user_id
      t.integer :post_id
      t.boolean :read, default: false
      t.text    :content

      t.timestamps
    end
  end
end
