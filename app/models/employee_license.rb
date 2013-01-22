class EmployeeLicense < ActiveRecord::Base
  attr_accessible :acquisition_date, :employee_id, :license_id
  belongs_to :employee
  belongs_to :license
end
