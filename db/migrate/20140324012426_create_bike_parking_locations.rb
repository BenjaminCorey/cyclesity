class CreateBikeParkingLocations < ActiveRecord::Migration
  def change
    create_table :bike_parking_locations do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.string :parking_type
      t.string :status
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
