# encoding:utf-8
module Reports
  class Profile
    # Profile印刷
    def self.render_profile(employee,licenses,skills,work,work_details)
      rc = 0
      report = ThinReports::Report.new 
      report.use_layout File.join(Rails.root, 'app', 'reports', 'profile.tlf'), :id => :first
      report.use_layout File.join(Rails.root, 'app', 'reports', 'profile_b.tlf'), :default => true
      
      report.start_new_page layout: :first
      
      # TODO: KeikenY(経験年数)
      # TODO: skill表示
      # TODO: license表示
      # TODO: appeal表示
      report.page.values create_date: employee.updated_at ,
                          name_kana:      employee.fullname_kana , 
                          name:           employee.fullname , 
                          gender:         employee.gender_judge , 
                          birthday:       employee.birthday , 
                          nenrei:         employee.nenrei , 
                          keikenY:        '99' , 
                          address:        employee.address , 
                          station:        employee.station , 
                          education:      employee.education , 
                          skill_DB:       'Oracle, SQLServer,mysql,SQLite3,mongoDB' , 
                          skill_Language: 'Ruby(Rails) , Java , VB , VBA , Javascript , ASP.NET , PHP' , 
                          skill_OS:       'Windows Server 2008 ,  Linux ,  Windows 7' , 
                          skill_hardware: 'IBM , Dell' , 
                          license:        'RubyAssotiationSilver , Java SJC-P 1.4 , 基本情報処理技術者' , 
                          appeal:         '頑張ってます。' 
      
      work_details.each do |work|
        if !report.page.layout.default? && report.page.list(:work_detail).overflow?
          report.start_new_page # Use :default layout
        end
        # TODO: d_mc(期間)
        # TODO: work_skill表示
        report.page.list(:work_detail).add_row do |row|
          row.values  d_no: rc+=1,
                      period_from:      work.period_form.strftime("%y/%m") ,
                      period_to:        work.period_to.strftime("%y/%m") ,
                      d_mc:             '12' ,
                      title:            work.title ,
                      subject:          work.subject ,
                      work_class:       work.work_class ,
                      job_class:        work.job_short_name ,
                      personnel_num:    work.personnel_num ,
                      skills_os:        "Windows Server 2008\nLinux\nWindows 7" ,
                      skills_language:  "Ruby(Rails)\nJava,VB\nVBA\nJavascript\nASP.NET\nPHP" ,
                      skills_DB:        "Oracle\nSQL Server\nmysql\nSQLite3\nmongoDB"
        end
      end
      
      report
    end
  end
end