class EmployeeLicense < ActiveRecord::Base
  attr_accessible :acquisition_date, :employee_id, :license_id
  belongs_to :employee
  belongs_to :license

  def employee_name()
    Employee.find(employee_id).fullname
  end
  def new_record()
    EmployeeLicense.new
  end
  def license_name()
    license.name.presence || "none"
  end
end
