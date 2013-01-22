class CreateWorks < ActiveRecord::Migration
  def change
    create_table :works do |t|
      t.integer :employee_id
      t.integer :sales_staff_id
      t.integer :customer_id

      t.timestamps
    end
  end
end
