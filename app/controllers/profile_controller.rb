class ProfileController < ApplicationController
	before_filter :authenticate_user!
  def index
  	@employee = Employee.find(current_user.employee_id)
  	#@employee_licenses = @employee.employee_licenses.all
  	@licenses = Employee.find(current_user.employee_id, :include => [:licenses])
  	#@employee_skills = @employee.employee_skills.all
  	@skills = Employee.find(current_user.employee_id, :include => [:skills])
  	@work = @employee.works.all
  end
end
