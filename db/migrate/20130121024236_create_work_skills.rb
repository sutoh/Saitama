class CreateWorkSkills < ActiveRecord::Migration
  def change
    create_table :work_skills do |t|
      t.integer :work_detail_id
      t.integer :skill_id

      t.timestamps
    end
  end
end
