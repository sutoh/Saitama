class Skill < ActiveRecord::Base
  attr_accessible :category, :name, :note
  has_many :employee_skills
  has_many :work_skills
end
