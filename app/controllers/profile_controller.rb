class ProfileController < ApplicationController
  def index
    @employee = current_user.employee
    @licenses = Employee.find(@employee, include: :licenses)
    @skills = Employee.find(@employee, include: :skills)
    @employee_skill = EmployeeSkill.find_by_employee_id(@employee, :first)
    @employee_skills = @employee.employee_skills.all
    @employee_license = EmployeeLicense.find_by_employee_id(@employee, :first)
    @employee_licenses = @employee.employee_licenses.all
    @work = @employee.works.all
    @work_details = []
    @work.each do |w|
      w.work_details.all.each do |wd|
        @work_details << wd
      end
    end
    @json = @employee.to_gmaps4rails
    respond_to do |format|
      format.html # profile.html.erb
      format.json { render json: @employee }
      # Example: Using thinreports-rails gem
      # see https://github.com/takeshinoda/thinreports-rails
#       format.pdf {
#         send_data render_to_string, filename: "employee#{@employee.id}.pdf",
#                                     type: 'application/pdf',
#                                     disposition: 'inline'
#       }
      format.pdf { render_profile(@employee,@licenses,@skills,@work,@work_details) }
    end
  end
end
