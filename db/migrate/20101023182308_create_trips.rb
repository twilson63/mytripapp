class CreateTrips < ActiveRecord::Migration
  def self.up
    create_table :trips do |t|
      t.string :name
      t.string :description
      t.datetime :start
      t.datetime :end
      t.integer :user_id
      t.string :slug

      t.timestamps
    end
  end

  def self.down
    drop_table :trips
  end
end
