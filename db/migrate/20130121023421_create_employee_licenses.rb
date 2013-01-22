class CreateEmployeeLicenses < ActiveRecord::Migration
  def change
    create_table :employee_licenses do |t|
      t.integer :employee_id
      t.integer :license_id
      t.date :acquisition_date

      t.timestamps
    end
  end
end
