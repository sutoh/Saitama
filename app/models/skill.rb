class Skill < ActiveRecord::Base
  attr_accessible :category, :name, :note
  has_many :employee_skills
  has_many :work_skills

  validates :category, numericality: true, inclusion: {in: 1..5}
  validates :name, presence: true

  def category_name
    Skill_cat_list[category] || "Unkown"
  end
end
