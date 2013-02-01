class Employee < ActiveRecord::Base
  attr_accessible :address, :birthday, :del_flg, :department_id, :education, :entrance_date, :experience, :family_name, :family_name_kana, :gender, :given_name, :given_name_kana, :postalcode, :self_pr, :staff_flg, :station, :tech_flg
  has_many :employee_licenses
  has_many :licenses, :through => :employee_licenses, :uniq => true
  has_many :employee_skills
  has_many :skills, :through => :employee_skills, :uniq => true
  belongs_to :department
  has_many :works
end
