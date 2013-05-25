class EmployeeLicensesController < ApplicationController
  # GET /employee_licenses
  # GET /employee_licenses.json
  def index
    #@employee_licenses = EmployeeLicense.all
    employee_id = params[:employee_id]
    @employee = Employee.find(employee_id)
    @employee_licenses = EmployeeLicense.find_all_by_employee_id(employee_id)
    @employee_licenses = @employee_licenses.presence || [EmployeeLicense.new(employee_id: employee_id)]

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @employee_licenses }
    end
  end

  # GET /employee_licenses/1
  # GET /employee_licenses/1.json
  def show
    @employee_license = EmployeeLicense.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @employee_license }
    end
  end

  # GET /employee_licenses/new
  # GET /employee_licenses/new.json
  def new
    @employee_license = EmployeeLicense.new(employee_id: params[:employee_id])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @employee_license }
    end
  end

  # GET /employee_licenses/1/edit
  def edit
    @employee = Employee.find(params[:employee_id])
    @employee_license = EmployeeLicense.find(params[:id])
  end

  # POST /employee_licenses
  # POST /employee_licenses.json
  def create
    employee_id = params[:employee_id]
    @employee = Employee.find(employee_id)
    @employee_licenses = EmployeeLicense.find_all_by_employee_id(employee_id)
    @employee_licenses = @employee_licenses.presence || [EmployeeLicense.new(employee_id: employee_id)]

    @employee_license = EmployeeLicense.new(params[:employee_license])
    @employee_license.employee = @employee

    respond_to do |format|
      if @employee_license.save
        format.html { redirect_to employee_employee_licenses_path(@employee), notice: 'Employee license was successfully created.' }
        format.json { render json: @employee_license, status: :created, location: @employee_license }
      else
        format.html { render action: "new" }
        format.json { render json: @employee_license.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /employee_licenses/1
  # PUT /employee_licenses/1.json
  def update
    if params[:employee_license_]
      EmployeeLicense.update(params[:employee_license_].keys, params[:employee_license_].values)
      redirect_to profile_index_path
      return
    end
    @employee = Employee.find(params[:employee_id])
    @employee_license = EmployeeLicense.find(params[:id])

    respond_to do |format|
      if @employee_license.update_attributes(params[:employee_license])
        format.html { redirect_to employee_employee_licenses_path(@employee), notice: 'Employee license was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @employee_license.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employee_licenses/1
  # DELETE /employee_licenses/1.json
  def destroy
    @employee = Employee.find(params[:employee_id])
    @employee_license = EmployeeLicense.find(params[:id])
    @employee_license.destroy

    respond_to do |format|
      format.html { redirect_to employee_employee_licenses_url(@employee) }
      format.json { head :no_content }
    end
  end
end
