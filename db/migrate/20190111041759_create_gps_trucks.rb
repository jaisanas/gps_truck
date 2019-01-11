class CreateGpsTrucks < ActiveRecord::Migration[5.1]
  def change
    create_table :gps_trucks do |t|

      t.timestamps
    end
  end
end
