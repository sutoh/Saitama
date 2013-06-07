class SkillsController < ApplicationController
  before_filter :set_skill, only: [:show, :edit, :update, :destroy]
  # GET /skills
  # GET /skills.json
  def index
    @skills = Skill.page(params[:page]).per(10)
  end

  # GET /skills/1
  # GET /skills/1.json
  def show
  end

  # GET /skills/new
  # GET /skills/new.json
  def new
    @skill = Skill.new
  end

  # GET /skills/1/edit
  def edit
  end

  # POST /skills
  # POST /skills.json
  def create
    @skill = Skill.new(params[:skill])

    respond_to do |format|
      if @skill.save
        format.html { redirect_to @skill, notice: 'Skill was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /skills/1
  # PUT /skills/1.json
  def update
    respond_to do |format|
      if @skill.update_attributes(params[:skill])
        format.html { redirect_to @skill, notice: 'Skill was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /skills/1
  # DELETE /skills/1.json
  def destroy
    @skill.destroy

    respond_to do |format|
      format.html { redirect_to skills_url }
    end
  end

  private

  def set_skill
    @skill = Skill.find(params[:id])
  end
end
