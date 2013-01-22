class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name
      t.integer :postalcode
      t.string :address
      t.string :website
      t.string :phone_num

      t.timestamps
    end
  end
end
