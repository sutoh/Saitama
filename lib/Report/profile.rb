module Report
  class Profile
    # Profile印刷
    def self.render_profile(employee,licenses,skills,work,work_details)
      rc = 0
      report = ThinReports::Report.new 
      report.use_layout File.join(Rails.root, 'app', 'reports', 'profile.tlf'), :id => :first
      report.use_layout File.join(Rails.root, 'app', 'reports', 'profile_b.tlf'), :default => true
      
      report.start_new_page layout: :first
      
      report.page.values create_date: employee.updated_at ,
                          name_kana:      '' , 
                          name:           'b' , 
                          gender:         'v' , 
                          birthday:       'd' , 
                          nenrei:         'e' , 
                          keikenY:        'f' , 
                          address:        'g' , 
                          station:        'h' , 
                          education:      'i' , 
                          skill_DB:       'j' , 
                          skill_Language: 'k' , 
                          skill_OS:       'l' , 
                          skill_hardware: 'm' , 
                          license:        'n' , 
                          appeal:         'o' 
      
      work_details.each do |work|
        if !report.page.layout.default? && report.page.list(:work_detail).overflow?
          report.start_new_page # Use :default layout
        end
    
        report.page.list(:work_detail).add_row do |row|
          row.values  d_no: rc+=1,
                      period_from:      '1' ,
                      period_to:        '2' ,
                      d_mc:             '3' ,
                      title:            '4' ,
                      subject:          '5' ,
                      work_class:       '6' ,
                      job_class:        '7' ,
                      personnel_num:    '8' ,
                      skills_os:        '9' ,
                      skills_language:  '0' ,
                      skills_DB:        '-'
        end
      end
      
      report
    end
  end
end