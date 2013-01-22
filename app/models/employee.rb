class Employee < ActiveRecord::Base
  attr_accessible :address, :birthday, :del_flg, :department_id, :education, :entrance_date, :experience, :family_name, :family_name_kana, :gender, :given_name, :given_name_kana, :postalcode, :self_pr, :staff_flg, :station, :tech_flg
  has_many :employee_licenses
  has_many :employee_skills
  belongs_to :department
  has_many :works
end
