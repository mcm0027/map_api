class RemoveContactsFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :contacts, :string
  end
end
