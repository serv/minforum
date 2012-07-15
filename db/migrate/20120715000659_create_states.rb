class CreateStates < ActiveRecord::Migration
  def change
    create_table :states do |t|
      t.boolean :new_message
      t.integer :user_id

      t.timestamps
    end
  end
end
