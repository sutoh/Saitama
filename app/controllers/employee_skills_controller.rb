class EmployeeSkillsController < ApplicationController
  # GET /employee_skills
  # GET /employee_skills.json
  def index
    #@employee_skills = EmployeeSkill.all
    @employee = Employee.find(params[:employee_id])
    @employee_skills = @employee.employee_skills.find(:all, select: "employee_skills.*, skills.name", joins: :skill)
    @employee_skill = EmployeeSkill.new
    @skills = Skill.find(:all, :select => "Skills.name, Skills.id")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @employee_skills }
    end
  end

  # GET /employee_skills/1
  # GET /employee_skills/1.json
  def show
    @employee_skill = EmployeeSkill.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @employee_skill }
    end
  end

  # GET /employee_skills/new
  # GET /employee_skills/new.json
  def new
    @employee = Employee.find(params[:employee_id])
    @employee_skill = EmployeeSkill.new
    @skills = Skill.find(:all, :select => "Skills.name, Skills.id")

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @employee_skill }
    end
  end

  # GET /employee_skills/1/edit
  def edit
    @employee = Employee.find(params[:employee_id])
    @employee_skill = EmployeeSkill.find(params[:id])
    @skills = Skill.find(:all, :select => "Skills.name, Skills.id")

  end

  # POST /employee_skills
  # POST /employee_skills.json
  def create
    @employee = Employee.find(params[:employee_id])
    @employee_skill = EmployeeSkill.new(params[:employee_skill])
    @employee_skill.employee = @employee
    @skills = Skill.find(:all, :select => "Skills.name, Skills.id")

    respond_to do |format|
      if @employee_skill.save
        format.html { redirect_to employee_employee_skills_path(@employee), notice: 'Employee skill was successfully created.' }
        format.json { render json: @employee_skill, status: :created, location: @employee_skill }
      else
        format.html { render action: "new" }
        format.json { render json: @employee_skill.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /employee_skills/1
  # PUT /employee_skills/1.json
  def update
    if params[:employee_skill_]
      EmployeeSkill.update(params[:employee_skill_].keys, params[:employee_skill_].values)
      redirect_to profile_index_path
      return
    end
    employee = Employee.find(params[:employee_id])
    @employee_skill = EmployeeSkill.find(params[:id])
    @skills = Skill.find(:all, :select => "Skills.name, Skills.id")

    respond_to do |format|
      if @employee_skill.update_attributes(params[:employee_skill])
        format.html { redirect_to employee_employee_skills_path(employee), notice: 'Employee skill was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @employee_skill.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employee_skills/1
  # DELETE /employee_skills/1.json
  def destroy
    @employee_skill = EmployeeSkill.find(params[:id])
    @employee_skill.destroy

    respond_to do |format|
      format.html { redirect_to employee_employee_skills_url(params[:employee_id]) }
      format.json { head :no_content }
    end
  end
end
