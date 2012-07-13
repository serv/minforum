class AddNewmessageToUsers < ActiveRecord::Migration
  def change
    add_column :users, :new_message, :boolean, default: false
  end
end
