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
# TODO 復活予定 データ増えすぎた...
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
  print "Table [User, License,department,employee,skill] deleted? y/n | "
  yn = STDIN.gets
  if (yn.chomp=='y') then
    User.delete_all
    License.delete_all
    Employee.delete_all
    Department.delete_all
    Skill.delete_all
    puts "XX Data, Goodbye XX"
  else
    puts "XX It does not delete XX"
  end
rescue => ex
  puts 'db_cleaner error'
  puts ex
end

# /spec/factories autoload
begin
  fg = FactoryGirl
  #TODO カッコ悪いんでかっこ良く治したい
  if (yn.chomp=='y') then
    user = fg.create(:user)
    puts "login_id: #{user.login_id} Create ok"
    user = fg.create(:user,:rubeus)
    puts "login_id: #{user.login_id} Create ok"
    user = fg.create(:user_sutoh)
    puts "login_id: #{user.login_id} Create ok"
    user = fg.create(:user_maeda)
    puts "login_id: #{user.login_id} Create ok"
    user = fg.create(:user_yawata)
    puts "login_id: #{user.login_id} Create ok"
    user = fg.create(:user_lee)
    puts "login_id: #{user.login_id} Create ok"
    user = fg.create(:user_izumi)
    puts "login_id: #{user.login_id} Create ok"
    user = fg.create(:user_kashiyama)
    puts "login_id: #{user.login_id} Create ok"
  end
  
  license = fg.create(:ruby_silver)
  puts "license: #{license.name} #{license.note} Create ok"
  license = fg.create(:ruby_gold)
  puts "license: #{license.name} #{license.note} Create ok"
  license = fg.create(:rails_bronze)
  puts "license: #{license.name} #{license.note} Create ok"
  license = fg.create(:java_1_4)
  puts "license: #{license.name} #{license.note} Create ok"
  license = fg.create(:oracle_bronze)
  puts "license: #{license.name} #{license.note} Create ok"
  
  employee = fg.create(:employee_yawata)
  puts "employee: #{employee.family_name} #{employee.department.id} #{employee.department.name} Create ok"
  employee = fg.create(:employee_maeda)
  puts "employee: #{employee.family_name} #{employee.department.id} #{employee.department.name} Create ok"
  employee = fg.create(:employee_sutoh)
  puts "employee: #{employee.family_name} #{employee.department.id} #{employee.department.name} Create ok"
  
  department = fg.create(:department)
  puts "department: #{department.id} #{department.name} Create ok"
  department = fg.create(:department, name: "技術部")
  puts "department: #{department.id} #{department.name} Create ok"
  department = fg.create(:department, name: "R&B")
  puts "department: #{department.id} #{department.name} Create ok"
  department = fg.create(:department, name: "営業本部")
  puts "department: #{department.id} #{department.name} Create ok"
  department = fg.create(:department, name: "開発部")
  puts "department: #{department.id} #{department.name} Create ok"
  department = fg.create(:department, name: "カスタマー部")
  puts "department: #{department.id} #{department.name} Create ok"
  department = fg.create(:department, name: "管理本部")
  puts "department: #{department.id} #{department.name} Create ok"
  
  skill = fg.create(:skill)
  puts "skill: #{skill.id} #{skill.name} Create ok"
  skill = fg.create(:skill,:ruby)
  puts "skill: #{skill.id} #{skill.name} Create ok"
  
  
rescue => ex
  puts 'create error'
  puts ex
end

