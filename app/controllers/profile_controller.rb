class ProfileController < ApplicationController
  def index
  	@employee = current_user.employee
  	@licenses = Employee.find(@employee, include: :licenses)
  	@skills = Employee.find(@employee, include: :skills)
  	@work = @employee.works.all
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
      format.pdf { render_profile(@employee,@licenses,@skills,@work) }
    end
  end
  
  def render_profile(employee)
    report = ThinReports::Report.new layout: File.join(Rails.root, 'app', 'reports', 'profile.tlf')

    report.start_new_page do |page|
      page.values employee: employee.id, 
                  name: employee.family_name, 
                  address: employee.address, 
                  birthday: employee.birthday, 
                  created_at: employee.created_at, 
                  updated_at: employee.updated_at
    end

    send_data report.generate, filename: 'profile.pdf', 
                               type: 'application/pdf', 
                               disposition: 'inline'
  end
  
end
