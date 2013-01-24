class ProfileController < ApplicationController
  def index
  	@employee = Employee.find(current_user.employee_id)
  	@employee_licenses = @employee.employee_licenses.all
  	@employee_skills = @employee.employee_skills.all
  	@work = @employee.works.all
  end
end
