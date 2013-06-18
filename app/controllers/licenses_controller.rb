class LicensesController < ApplicationController
  before_filter :set_license, only: [:show, :edit, :update, :destroy]
  # GET /licenses
  # GET /licenses.json
  def index
    @licenses = License.page(params[:page]).per(10)
  end

  # GET /licenses/1
  # GET /licenses/1.json
  def show
  end

  # GET /licenses/new
  # GET /licenses/new.json
  def new
    @license = License.new
  end

  # GET /licenses/1/edit
  def edit
  end

  # POST /licenses
  # POST /licenses.json
  def create
    @license = License.new(params[:license])

    respond_to do |format|
      if @license.save
        format.html { redirect_to @license, notice: 'License was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /licenses/1
  # PUT /licenses/1.json
  def update
    respond_to do |format|
      if @license.update_attributes(params[:license])
        format.html { redirect_to @license, notice: 'License was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /licenses/1
  # DELETE /licenses/1.json
  def destroy
    @license.destroy

    respond_to do |format|
      format.html { redirect_to licenses_url }
    end
  end

  private

  def set_license
    @license = License.find(params[:id])
  end
end
