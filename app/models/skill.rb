class Skill < ActiveRecord::Base
  attr_accessible :category, :name, :note
  has_many :employee_Skills
  has_many :work_Skills
end
