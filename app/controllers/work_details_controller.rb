class WorkDetailsController < ApplicationController
  before_filter :set_workdetail, only: [:show, :edit, :update, :destroy]
  before_filter :set_work, [:new, :edit, :create, :update]
  # GET /work_details
  # GET /work_details.json
  def index
    #@work_details = WorkDetail.all
    @work_details = Work.find(params[:work_id]).work_details.all


    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @work_details }
    end
  end

  # GET /work_details/1
  # GET /work_details/1.json
  def show

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @work_detail }
    end
  end

  # GET /work_details/new
  # GET /work_details/new.json
  def new
    @work_detail = WorkDetail.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @work_detail }
    end
  end

  # GET /work_details/1/edit
  def edit
  end

  # POST /work_details
  # POST /work_details.json
  def create
    @work_detail = WorkDetail.new(params[:work_detail])

    respond_to do |format|
      if @work_detail.save
        format.html { redirect_to [@work, @work_detail], notice: 'Work detail was successfully created.' }
        format.json { render json: @work_detail, status: :created, location: @work_detail }
      else
        format.html { render action: "new" }
        format.json { render json: @work_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /work_details/1
  # PUT /work_details/1.json
  def update
    respond_to do |format|
      if @work_detail.update_attributes(params[:work_detail])
        format.html { redirect_to [work,@work_detail], notice: 'Work detail was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @work_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /work_details/1
  # DELETE /work_details/1.json
  def destroy
    @work_detail.destroy

    respond_to do |format|
      format.html { redirect_to work_work_details_url(params[:work_id]) }
      format.json { head :no_content }
    end
  end

  private

  def set_workdetail
    @work_detail = WorkDetail.find(params[:id])
  end
  def set_work
    @work = Work.find(params[:work_id])
  end
end
