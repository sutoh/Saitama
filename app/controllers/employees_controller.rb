
class EmployeesController < ApplicationController
  # GET /employees
  # GET /employees.json
  def index
    @employees = Employee.all
    @json = Employee.all.to_gmaps4rails

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @employees }
      # Example: Basic Usage
      format.pdf { render_employee_list(@employees) }
    end
  end

  # GET /employees/1
  # GET /employees/1.json
  def show
    @employee = Employee.find(params[:id])
    @json = Employee.find(params[:id]).to_gmaps4rails
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @employee }
      # Example: Using thinreports-rails gem
      # see https://github.com/takeshinoda/thinreports-rails
      format.pdf {
        send_data render_to_string, filename: "employee#{@employee.id}.pdf",
                                    type: 'application/pdf',
                                    disposition: 'inline'
      }
    end
  end

  # GET /employees/new
  # GET /employees/new.json
  def new
    @employee = Employee.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @employee }
    end
  end

  # GET /employees/1/edit
  def edit
    @employee = Employee.find(params[:id])
  end

  # POST /employees
  # POST /employees.json
  def create
    @employee = Employee.new(params[:employee])
    respond_to do |format|
      if @employee.save
        format.html { redirect_to @employee, notice: 'Employee was successfully created.' }
        format.json { render json: @employee, status: :created, location: @employee }
      else
        format.html { render action: "new" }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /employees/1
  # PUT /employees/1.json
  def update
    @employee = Employee.find(params[:id])

    respond_to do |format|
      if @employee.update_attributes(params[:employee])
        format.html { redirect_to @employee, notice: 'Employee was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employees/1
  # DELETE /employees/1.json
  def destroy
    @employee = Employee.find(params[:id])
    @employee.destroy

    respond_to do |format|
      format.html { redirect_to employees_url }
      format.json { head :no_content }
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
  
end
