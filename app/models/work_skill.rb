class WorkSkill < ActiveRecord::Base
  attr_accessible :skill_id, :work_detail_id
  belongs_to :skill
  belongs_to :work_detail

  validates :skill_id, presence: true
  validates :work_detail_id, presence: true
end
