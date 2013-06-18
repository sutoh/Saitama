
class EmployeesController < ApplicationController
  # GET /employees
  # GET /employees.json
  before_filter :set_department_list, only: [:new, :edit, :create, :update]
  before_filter :set_employee, only: [:edit, :update, :destroy]

  def index
    @employees = Employee.all
    @json = Employee.all.to_gmaps4rails

    respond_to do |format|
      format.html # index.html.erb
      # Example: Basic Usage
      format.pdf { render_employee_list(@employees) }
    end
  end

  # GET /employees/1
  # GET /employees/1.json
  def show
    @profile = Profile.new(get_employee_from_params)
    respond_to do |format|
      format.html # show.html.erb
      # Example: Using thinreports-rails gem
      # see https://github.com/takeshinoda/thinreports-rails
      format.pdf {  report = Reports::Profile::render_profile(@profile.employee,@profile.licenses,@profile.skills,@profile.works,@profile.work_details)
                    send_data report.generate, filename: 'profile.pdf', 
                                               type: 'application/pdf', 
                                               disposition: 'inline' }
    end
  end

  # GET /employees/new
  # GET /employees/new.json
  def new
    @employee = Employee.new
  end

  # GET /employees/1/edit
  def edit
  end

  # POST /employees
  # POST /employees.json
  def create
    @employee = Employee.new(params[:employee])
    respond_to do |format|
      if @employee.save
        format.html { redirect_to @employee, notice: 'Employee was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /employees/1
  # PUT /employees/1.json
  def update
    respond_to do |format|
      if @employee.update_attributes(params[:employee])
        format.html { redirect_to @employee, notice: 'Employee was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /employees/1
  # DELETE /employees/1.json
  def destroy
    @employee.destroy

    respond_to do |format|
      format.html { redirect_to employees_url }
    end
  end

  private

  def render_employee_list(employees)
    report = ThinReports::Report.new layout: File.join(Rails.root, 'app', 'reports', 'employees.tlf')

    employees.each do |employee|
      report.list.add_row do |row|
        row.values id: employee.id, 
                   name: employee.family_name, 
                   birthday: employee.birthday, 
                   address: employee.address
        row.item(:name).style(:color, 'red') 
      end
    end
    
    send_data report.generate, filename: 'employees.pdf', 
                               type: 'application/pdf', 
                               disposition: 'attachment'
  end

  def set_department_list
    @departments = Department.find(:all, :select => "Departments.name, Departments.id")
  end

  def set_employee
    @employee = get_employee_from_params
  end

  def get_employee_from_params
    Employee.find(params[:id])
  end 
end
