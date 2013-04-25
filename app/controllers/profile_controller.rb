class ProfileController < ApplicationController
  def index
  	@employee = current_user.employee
  	@licenses = Employee.find(@employee, include: :licenses)
  	@skills = Employee.find(@employee, include: :skills)
  	@work = @employee.works.all
    @json = current_user.employee.to_gmaps4rails
  end
end
