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

  license_a = [:ruby_silver,:ruby_gold,:rails_bronze,:java_1_4,:oracle_bronze]
  
  license_a.each do |l|
    license = fg.create(l)
    puts "license: #{license.name} #{license.note} Create ok"
  end
    
  dept = fg.create(:department)
  puts "department: #{dept.id} #{dept.name} Create ok"
  
  dept_a = ["技術部","R&B","営業本部","カスタマー部","管理本部","Ruby部"]
  dept_a.each do |d|
    dept = fg.create(:department,name: d)
    puts "department: #{dept.id} #{dept.name} Create ok"
  end
  
  skill = fg.create(:skill)
  puts "skill: #{skill.id} #{skill.name} Create ok"
  skill = fg.create(:skill_ruby)
  puts "skill: #{skill.id} #{skill.name} Create ok"
  skill = fg.create(:skill_rails)
  puts "skill: #{skill.id} #{skill.name} Create ok"
  skill = fg.create(:skill_java)
  puts "skill: #{skill.id} #{skill.name} Create ok"
  skill = fg.create(:skill_android)
  puts "skill: #{skill.id} #{skill.name} Create ok"
  skill = fg.create(:skill_javascrirpt)
  puts "skill: #{skill.id} #{skill.name} Create ok"
  skill = fg.create(:skill_vb_asp)
  puts "skill: #{skill.id} #{skill.name} Create ok"
  skill = fg.create(:skill_vb)
  puts "skill: #{skill.id} #{skill.name} Create ok"
  skill = fg.create(:skill_vba)
  puts "skill: #{skill.id} #{skill.name} Create ok"
  skill = fg.create(:skill_oracle)
  puts "skill: #{skill.id} #{skill.name} Create ok"
  skill = fg.create(:skill_sqlserver)
  puts "skill: #{skill.id} #{skill.name} Create ok"
  skill = fg.create(:skill_mysql)
  puts "skill: #{skill.id} #{skill.name} Create ok"
  skill = fg.create(:skill_hadoop)
  puts "skill: #{skill.id} #{skill.name} Create ok"
  skill = fg.create(:skill_win_client)
  puts "skill: #{skill.id} #{skill.name} Create ok"
  skill = fg.create(:skill_win_server)
  puts "skill: #{skill.id} #{skill.name} Create ok"
  skill = fg.create(:skill_mac)
  puts "skill: #{skill.id} #{skill.name} Create ok"
  skill = fg.create(:skill_ubuntu)
  puts "skill: #{skill.id} #{skill.name} Create ok"
  skill = fg.create(:skill_linux)
  puts "skill: #{skill.id} #{skill.name} Create ok"
  skill = fg.create(:skill_aix)
  puts "skill: #{skill.id} #{skill.name} Create ok"
  
  dept_ruby = Department.where(name: "Ruby部").first
  employee = fg.create(:employee_yawata, department: dept_ruby)
  puts "employee: #{employee.family_name} #{employee.department.id} #{employee.department.name} Create ok"
  employee = fg.create(:employee_maeda)
  puts "employee: #{employee.family_name} #{employee.department.id} #{employee.department.name} Create ok"
  employee = fg.create(:employee_sutoh)
  puts "employee: #{employee.family_name} #{employee.department.id} #{employee.department.name} Create ok"
  
  
  if (yn.chomp=='y') then
    user = fg.create(:user,:rubeus)
    puts "login_id: #{user.login_id} Create ok"
    user_a = [:user_sutoh,:user_maeda,:user_yawata,:user_lee,:user_izumi,:user_kashiyama]
    user_a.each do |u|
      user = fg.create(u)
      puts "login_id: #{user.login_id} Create ok"
    end
  end
  
  user = fg.create(:user)
  puts "login_id: #{user.login_id} Create ok"
  employee = fg.create(:employee, user: user)
  puts "employee: #{employee.id} #{employee.family_name} #{employee.department.id} #{employee.department.name} Create ok"
  
rescue => e
  puts 'create error'
  puts e
end

