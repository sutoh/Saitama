class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :family_name
      t.string :given_name
      t.string :family_name_kana
      t.string :given_name_kana
      t.integer :gender
      t.date :birthday
      t.integer :experience
      t.date :entrance_date
      t.string :postalcode
      t.string :address
      t.string :station
      t.string :education
      t.text :self_pr
      t.integer :tech_flg
      t.integer :staff_flg
      t.integer :del_flg
      t.integer :department_id

      t.timestamps
    end
  end
end
