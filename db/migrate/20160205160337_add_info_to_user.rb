class AddInfoToUser < ActiveRecord::Migration
  def change
    add_column :users, :timezone, :string
    add_column :users, :contacts, :string
  end
end
