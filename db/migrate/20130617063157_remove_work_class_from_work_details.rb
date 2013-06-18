class RemoveWorkClassFromWorkDetails < ActiveRecord::Migration
  def up
    remove_column :work_details, :work_class
  end

  def down
    add_column :work_details, :work_class, :integer
  end
end
