class DepartmentsController < ApplicationController
  before_filter :set_department, only: [:show, :edit, :update, :destroy]
  # GET /departments
  # GET /departments.json
  def index
    @departments = Department.all
  end

  # GET /departments/1
  # GET /departments/1.json
  def show
  end

  # GET /departments/new
  # GET /departments/new.json
  def new
    @department = Department.new
  end

  # GET /departments/1/edit
  def edit
  end

  # POST /departments
  # POST /departments.json
  def create
    @department = Department.new(params[:department])

    respond_to do |format|
      if @department.save
        format.html { redirect_to @department, notice: 'Department was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /departments/1
  # PUT /departments/1.json
  def update
    respond_to do |format|
      if @department.update_attributes(params[:department])
        format.html { redirect_to @department, notice: 'Department was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /departments/1
  # DELETE /departments/1.json
  def destroy
    @department.destroy

    respond_to do |format|
      format.html { redirect_to departments_url }
    end
  end

  private

  def set_department
    @department = Department.find(params[:id])
  end
end
