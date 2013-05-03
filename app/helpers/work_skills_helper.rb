module WorkSkillsHelper
  def skill_name(skill_id)
    skill = Skill.find_by_id(skill_id) 
    skill ? skill.name : ""
  end
end
