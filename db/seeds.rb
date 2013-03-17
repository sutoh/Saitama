# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'factory_girl'
require 'database_cleaner'
# TODO Delete
=begin
seed_files = Dir.glob(File.dirname(__FILE__) + "/seeds/" + Rails.env + "/*.rb")
seed_files.each do |file|
  puts "Creating #{File.basename(file)}"
  require file
end
=end

begin
  #TODO 削除されない??
  #DatabaseCleaner.start
  #削除されるのでとりあえず代用
  User.delete_all
rescue
  puts 'db_cleaner error'
end

# /spec/factories autoload
begin
  #TODO カッコ悪いんでかっこ良く治したい
  user = FactoryGirl.create(:user)
  puts "login_id: #{user.login_id} create ok"
  user = FactoryGirl.create(:sutoh)
  puts "login_id: #{user.login_id} create ok"
rescue
  puts 'create error'
end

