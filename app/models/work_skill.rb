class WorkSkill < ActiveRecord::Base
  attr_accessible :skill_id, :work_detail_id
  belongs_to :skill
  belongs_to :work_detail
end
