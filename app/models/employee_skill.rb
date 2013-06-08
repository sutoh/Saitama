class EmployeeSkill < ActiveRecord::Base
  attr_accessible :employee_id, :level, :skill_id
  belongs_to :employee
  belongs_to :skill

  #Validates
  validates :employee_id, presence: true
  validates :level, allow_blank: true, numericality: true, inclusion: {in: 0..5}
  validates :skill_id, presence: true

  def skill_name()
    skill.name.presence || "none"
  end
end
