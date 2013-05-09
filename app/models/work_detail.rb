class WorkDetail < ActiveRecord::Base
  attr_accessible :job_class, :period_form, :period_to, :personnel_num, :role, :subject, :title, :work_class, :work_id, :work_role
  has_many :work_skills
  belongs_to :work
  
  def job_short_name
   Job_short_list[job_class.to_i] || ""
  end
end
