class EmployeeSkillsController < ApplicationController
  before_filter :set_employee, except: [:show, :destroy]
  before_filter :set_skill_list, except: [:show, :destroy]
  before_filter :set_employeeSkill_from_params, only: [:show, :edit, :update, :destroy]
  # GET /employee_skills
  # GET /employee_skills.json
  def index
    #@employee_skills = EmployeeSkill.all
    have_employee_skills = EmployeeSkill.find_all_by_employee_id(@employee.id)
    @employee_skill = EmployeeSkill.new
    have_not_employee_skills = []

    Skill.all.each do |s|
      unless have_employee_skills.collect{|l| l.skill_id}.include?(s.id)
        have_not_employee_skills << EmployeeSkill.new({employee_id: @employee.id, skill_id: s.id, level: 0})
      end
    end
    @employee_skills = (have_employee_skills + have_not_employee_skills).sort_by{|a|[a.category, a.skill_name.upcase]}
    
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
        unless params[:employee_skill][:level] == "0"
          @employee_skill = EmployeeSkill.find(params[:id])
        else
          @employee_skill.destroy
          @employee_skill = EmployeeSkill.new(params[:employee_skill])
        end
        format.html { redirect_to employee_employee_skills_path(@employee), notice: 'Employee skill was successfully updated.' }
        format.js
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
