class ApplicationController < ActionController::Base
	before_filter :authenticate_user!
  protect_from_forgery
  
  #権限管理用定数
  ADMIN = 1
  
  private
  
  def after_sign_in_path_for(resource_or_scope)
    profile_index_path
  end
  
  def after_sign_out_path_for(resource_or_scope)
    user_session_path
  end
  
  # Profile印刷
  def render_profile(employee,licenses,skills,work,work_details)
    report = ThinReports::Report.new layout: File.join(Rails.root, 'app', 'reports', 'profile.tlf')
    
    report.start_new_page do |page|
      page.values create_date: employee.updated_at ,
                    name_kana: 'a' , 
                         name: 'b' , 
                       gender: 'v' , 
                     birthday: 'd' , 
                       nenrei: 'e' , 
                      keikenY: 'f' , 
                      address: 'g' , 
                      station: 'h' , 
                    education: 'i' , 
                     skill_DB: 'j' , 
               skill_Language: 'k' , 
                     skill_OS: 'l' , 
               skill_hardware: 'm' , 
                      license: 'n' , 
                       appeal: 'o' 
    end
    
    work_details.each do |work|
      report.page.list(:default).add_row do |row|
        rc.nil? ? rc=0 : rc+=1
        row.values d_no: rc,
             period_from: '' ,
               period_to: '' ,
                    d_mc: '' ,
                   title: '' ,
                 subject: '' ,
              work_class: '' ,
               job_class: '' ,
           personnel_num: '' ,
               skills_os: '' ,
         skills_language: '' ,
               skills_DB: ''
      end
    end

    send_data report.generate, filename: 'profile.pdf', 
                               type: 'application/pdf', 
                               disposition: 'inline'
  end
  
  
end
