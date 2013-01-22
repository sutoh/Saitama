class CreateWorkDetails < ActiveRecord::Migration
  def change
    create_table :work_details do |t|
      t.integer :work_id
      t.string :title
      t.text :subject
      t.text :role
      t.text :work_role
      t.integer :work_class
      t.string :job_class
      t.integer :personnel_num
      t.date :period_form
      t.date :period_to

      t.timestamps
    end
  end
end
