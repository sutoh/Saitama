class WorkSkillsController < ApplicationController
  before_filter :authenticate_user!
  # GET /work_skills
  # GET /work_skills.json
  def index
    #@work_skills = WorkSkill.all
    @work_skills = Work.find(params[:work_id]).work_details.find(params[:work_detail_id]).work_skills.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @work_skills }
    end
  end

  # GET /work_skills/1
  # GET /work_skills/1.json
  def show
    @work_skill = WorkSkill.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @work_skill }
    end
  end

  # GET /work_skills/new
  # GET /work_skills/new.json
  def new
    @work = Work.find(params[:work_id])
    @work_detail = @work.work_details.find(params[:work_detail_id])
    #@work_skill = WorkSkill.new
    @work_skill = @work_detail.work_skills.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @work_skill }
    end
  end

  # GET /work_skills/1/edit
  def edit
    @work = Work.find(params[:work_id])
    @work_detail = @work.work_details.find(params[:work_detail_id])
    @work_skill = WorkSkill.find(params[:id])
  end

  # POST /work_skills
  # POST /work_skills.json
  def create
    work = Work.find(params[:work_id])
    work_detail = work.work_details.find(params[:work_detail_id])
    @work_skill = WorkSkill.new(params[:work_skill])

    respond_to do |format|
      if @work_skill.save
        format.html { redirect_to [work, work_detail, @work_skill], notice: 'Work skill was successfully created.' }
        format.json { render json: @work_skill, status: :created, location: @work_skill }
      else
        format.html { render action: "new" }
        format.json { render json: @work_skill.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /work_skills/1
  # PUT /work_skills/1.json
  def update
    work = Work.find(params[:work_id])
    work_detail = work.work_details.find(params[:work_detail_id])
    @work_skill = WorkSkill.find(params[:id])

    respond_to do |format|
      if @work_skill.update_attributes(params[:work_skill])
        format.html { redirect_to [work, work_detail, @work_skill], notice: 'Work skill was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @work_skill.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /work_skills/1
  # DELETE /work_skills/1.json
  def destroy
    @work_skill = WorkSkill.find(params[:id])
    @work_skill.destroy

    respond_to do |format|
      format.html { redirect_to work_work_detail_work_skills_url(params[:work_id], params[:work_detail_id]) }
      format.json { head :no_content }
    end
  end
end
