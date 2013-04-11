class AddLatitudeLongitudeGmapsToEmployees < ActiveRecord::Migration
  def change
    add_column :employees, :latitude, :float
    add_column :employees, :longitude, :float
    add_column :employees, :gmaps, :boolean
  end
end
