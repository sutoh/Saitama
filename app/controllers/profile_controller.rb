class ProfileController < ApplicationController
  def index
    @employee = current_user.employee
    @licenses = Employee.find(@employee, include: :licenses).licenses
    @skills = Employee.find(@employee, include: :skills).skills
    @employee_skill = @employee.employee_skills.find(:first)
    @employee_skills = @employee.employee_skills.all
    @employee_license = @employee.employee_licenses.find(:first)
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
      format.pdf {  report = Reports::Profile::render_profile(@employee,@licenses,@skills,@work,@work_details)
                    send_data report.generate, filename: 'profile.pdf', 
                                               type: 'application/pdf', 
                                               disposition: 'inline' }
    end
  end
end
