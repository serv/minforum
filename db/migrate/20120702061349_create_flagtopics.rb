class CreateFlagtopics < ActiveRecord::Migration
  def change
    create_table :flagtopics do |t|
      t.integer :user_id
      t.integer :topic_id
      t.boolean :read, default: false

      t.timestamps
    end
  end
end
