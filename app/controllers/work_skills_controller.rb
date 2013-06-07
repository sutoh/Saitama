class WorkSkillsController < ApplicationController
  before_filter :set_workSkill, only: [:show, :edit, :update, :destroy]
  before_filter :set_work, only: [:new, :edit, :create, :update]
  before_filter :set_work_detail, only: [:new, :edit, :create, :update]
  before_filter :set_skill, only: [:new, :edit]
  # GET /work_skills
  # GET /work_skills.json
  def index
    #@work_skills = WorkSkill.all
    @work_skills = Work.find(params[:work_id]).work_details.find(params[:work_detail_id]).work_skills.all
    @work_title = Work.find(params[:work_id]).customer.name || " "
  end

  # GET /work_skills/1
  # GET /work_skills/1.json
  def show
  end

  # GET /work_skills/new
  # GET /work_skills/new.json
  def new
    @work_skill = @work_detail.work_skills.new
  end

  # GET /work_skills/1/edit
  def edit
  end

  # POST /work_skills
  # POST /work_skills.json
  def create
    @work_skill = WorkSkill.new(params[:work_skill])

    respond_to do |format|
      if @work_skill.save
        format.html { redirect_to [@work, @work_detail, @work_skill], notice: 'Work skill was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /work_skills/1
  # PUT /work_skills/1.json
  def update
    respond_to do |format|
      if @work_skill.update_attributes(params[:work_skill])
        format.html { redirect_to [@work, @work_detail, @work_skill], notice: 'Work skill was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /work_skills/1
  # DELETE /work_skills/1.json
  def destroy
    @work_skill.destroy

    respond_to do |format|
      format.html { redirect_to work_work_detail_work_skills_url(params[:work_id], params[:work_detail_id]) }
    end
  end

  private
  def set_workSkill
    @work_skill = WorkSkill.find(params[:id])
  end
  def set_work
    @work = Work.find(params[:work_id])
  end
  def set_work_detail
    @work_detail = @work.work_details.find(params[:work_detail_id])
  end
  def set_skill
    @skill = Skill.all
  end
end
