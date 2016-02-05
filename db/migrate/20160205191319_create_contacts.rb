class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :location
      t.string :contactTimezone
      t.timestamp :localTime

      t.timestamps
    end
  end
end
