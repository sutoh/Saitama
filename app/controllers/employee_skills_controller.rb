class EmployeeSkillsController < ApplicationController
  before_filter :set_employee, except: [:show, :destroy]
  before_filter :set_skill_list, except: [:show, :destroy]
  before_filter :set_employeeSkill_from_params, only: [:show, :edit, :update, :destroy]
  # GET /employee_skills
  # GET /employee_skills.json
  def index
    #@employee_skills = EmployeeSkill.all
    @employee_skills = EmployeeSkill.find_all_by_employee_id(@employee.id)
    @employee_skill = EmployeeSkill.new
  end

  # GET /employee_skills/1
  # GET /employee_skills/1.json
  def show
  end

  # GET /employee_skills/new
  # GET /employee_skills/new.json
  def new
    @employee_skill = EmployeeSkill.new
  end

  # GET /employee_skills/1/edit
  def edit
  end

  # POST /employee_skills
  # POST /employee_skills.json
  def create
    @employee_skill = EmployeeSkill.new(params[:employee_skill])
    @employee_skill.employee = @employee

    respond_to do |format|
      if @employee_skill.save
        format.html { redirect_to employee_employee_skills_path(@employee), notice: 'Employee skill was successfully created.' }
        format.js   # ajax用に追加        
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /employee_skills/1
  # PUT /employee_skills/1.json
  def update
    if params[:employee_skill_]
      EmployeeSkill.update(params[:employee_skill_].keys, params[:employee_skill_].values)
      redirect_to profile_path
      return
    end

    respond_to do |format|
      if @employee_skill.update_attributes(params[:employee_skill])
        format.html { redirect_to employee_employee_skills_path(@employee), notice: 'Employee skill was successfully updated.' }
      else
        format.html { render action: "edit" }      
      end
    end
  end

  # DELETE /employee_skills/1
  # DELETE /employee_skills/1.json
  def destroy
    @employee_skill.destroy

    respond_to do |format|
      format.html { redirect_to employee_employee_skills_url(params[:employee_id]) }
    end
  end

  private

  def set_employee
    @employee = Employee.find(params[:employee_id])
  end

  def set_skill_list
    @skills = Skill.find(:all, :select => "Skills.name, Skills.id")
  end

  def set_employeeSkill_from_params
    @employee_skill = EmployeeSkill.find(params[:id])
  end
end
