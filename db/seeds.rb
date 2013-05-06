# -*- encoding: utf-8 -*-
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'factory_girl'
require 'database_cleaner'

FactoryGirl.factories.clear
FactoryGirl.definition_file_paths = [File.join(Rails.root, 'db', 'seeds', Rails.env, 'factories')]
 FactoryGirl.reload
# seed_files = Dir.glob(File.dirname(__FILE__) + "/seeds/" + Rails.env + "/*.rb")

#TODO 削除されない??
#DatabaseCleaner.start
#削除されるのでとりあえず代用
#tables = ActiveRecord::Base.connection.tables.delete("schema_migration").join(",")

puts "Detecting All tables of this Rails App..."
puts ""
puts "[tables]"

puts "--------------------"
tables = ActiveRecord::Base.connection.tables
tables.delete("schema_migrations")
puts tables
puts "--------------------"
puts ""

print "These tables will be truncated. Are you sure? (y/n) | "
yn = STDIN.gets
puts ""
if (yn.chomp == 'y')
  tables.each do |table|
    # MySQL
    #ActiveRecord::Base.connection.execute("TRUNCATE #{table}") unless table == "schema_migrations"
    # SQLite
    puts "truncating #{table}..."
    ActiveRecord::Base.connection.execute("DELETE FROM #{table}") unless table == "schema_migrations"
    puts "#{table} is successfully truncated."
  end
else
  exit
end

# Create All Factories
puts ""
puts "Create all factories..."
puts ""

FactoryGirl.factories.each do |factory|
  if tables.include?(factory.name.to_s.pluralize)
  else
    puts "creating #{factory.name}..."
    FactoryGirl.create(factory.name)
    puts "#{factory.name} is successfully created."
  end
end
