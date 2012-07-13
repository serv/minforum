class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :to_user
      t.string :subject
      t.text :content
      t.integer :user_id
      t.integer :recipient
      t.integer :read, :default => 0

      t.timestamps
    end
  end
end
