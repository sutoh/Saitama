module ApplicationHelper
  def legend_view
    action_name + " " +  controller_name
  end
  def action_name
    controller.action_name 
  end
  def controller_name
    params[:controller].classify
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
      report.list.add_row do |row|
        rc.nil? ? rc=0 : rc+=1
        work.values d_no: rc,
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
