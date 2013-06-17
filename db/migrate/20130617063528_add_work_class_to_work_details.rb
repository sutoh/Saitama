class AddWorkClassToWorkDetails < ActiveRecord::Migration
  def change
    add_column :work_details, :work_class, :string
  end
end
