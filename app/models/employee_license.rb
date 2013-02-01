class EmployeeLicense < ActiveRecord::Base
  attr_accessible :acquisition_date, :employee_id, :license_id
  belongs_to :employee
  belongs_to :license

  def get_employee_names(employee_id)
  	employee_ids = EmployeeLicense.find(:employee_id => employee_id)
  	employee_ids.each do |f|
  		employee = Employee.find(f.employee_id)
  		employee_names = employee.family_name + " " + employee.given_name
  	end
  	return employee_names
  end
end
