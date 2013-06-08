class ProfilesController < ApplicationController
  def show
    @profile = Profile.new(current_user.employee)
    respond_to do |format|
      format.html # profile.html.erb
      format.json { render json: @profile.employee }
      # Example: Using thinreports-rails gem
      # see https://github.com/takeshinoda/thinreports-rails
      format.pdf {  report = Reports::Profile::render_profile(@profile.employee,@profile.licenses,@profile.skills,@profile.works,@profile.work_details)
                    send_data report.generate, filename: 'profile.pdf', 
                                               type: 'application/pdf', 
                                               disposition: 'inline' }
    end
  end
  def edit
    @profile = current_user
  end
  def update
    @profile = current_user
    respond_to do |format|
      if @profile.update_attributes(params[:user])
        sign_in(@profile, :bypass => true) 
        format.html { redirect_to :profile, :notice => 'User was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @profile.errors, :status => :unprocessable_entity }
      end
    end
  end
  
end
