class AddAttachmentImageToEmployees < ActiveRecord::Migration
  def self.up
    change_table :employees do |t|
      t.attachment :image
    end
  end

  def self.down
    drop_attached_file :employees, :image
  end
end
