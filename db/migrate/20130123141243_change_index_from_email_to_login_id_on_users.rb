class ChangeIndexFromEmailToLoginIdOnUsers < ActiveRecord::Migration
def self.up
  remove_index :users, :email
  add_index :users, :login_id
end

def self.down 
	add_index :users, :email
  remove_index :users, :login_id
end
end
