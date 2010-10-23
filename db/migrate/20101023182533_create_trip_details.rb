class CreateTripDetails < ActiveRecord::Migration
  def self.up
    create_table :trip_details do |t|
      t.integer :trip_id
      t.string :detail_type
      t.string :name
      t.string :value

      t.timestamps
    end
  end

  def self.down
    drop_table :trip_details
  end
end
