class EmployeeLicensesController < ApplicationController
  before_filter :set_employeeLicense, only: [:show, :edit, :update, :destroy]
  before_filter :set_employee, only: [:index, :edit, :create, :update, :destroy]
  # GET /employee_licenses
  # GET /employee_licenses.json
  def index
    #@employee_licenses = EmployeeLicense.all
    employee_id = params[:employee_id]
    @employee_licenses = EmployeeLicense.find_all_by_employee_id(employee_id)
    @employee_licenses = @employee_licenses.presence || [EmployeeLicense.new(employee_id: employee_id)]
  end

  # GET /employee_licenses/1
  # GET /employee_licenses/1.json
  def show
  end

  # GET /employee_licenses/new
  # GET /employee_licenses/new.json
  def new
    @employee_license = EmployeeLicense.new(employee_id: params[:employee_id])
  end

  # GET /employee_licenses/1/edit
  def edit
  end

  # POST /employee_licenses
  # POST /employee_licenses.json
  def create
    employee_id = params[:employee_id]
    @employee_licenses = EmployeeLicense.find_all_by_employee_id(employee_id)
    @employee_licenses = @employee_licenses.presence || [EmployeeLicense.new(employee_id: employee_id)]

    @employee_license = EmployeeLicense.new(params[:employee_license])
    @employee_license.employee = @employee

    respond_to do |format|
      if @employee_license.save
        format.html { redirect_to employee_employee_licenses_path(@employee), notice: 'Employee license was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /employee_licenses/1
  # PUT /employee_licenses/1.json
  def update
    if params[:employee_license_]
      EmployeeLicense.update(params[:employee_license_].keys, params[:employee_license_].values)
      redirect_to profile_path
      return
    end

    respond_to do |format|
      if @employee_license.update_attributes(params[:employee_license])
        format.html { redirect_to employee_employee_licenses_path(@employee), notice: 'Employee license was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /employee_licenses/1
  # DELETE /employee_licenses/1.json
  def destroy
    @employee_license.destroy

    respond_to do |format|
      format.html { redirect_to employee_employee_licenses_url(@employee) }
    end
  end

  private
  def set_employeeLicense
    @employee_license = EmployeeLicense.find(params[:id])
  end
  def set_employee
    @employee = Employee.find(params[:employee_id])
  end
end
