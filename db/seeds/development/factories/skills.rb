# -*- encoding: utf-8 -*-
FactoryGirl.define do
  factory :skill do
    name "skill"
    category 0
    note "none"
    
    trait :programming do
      category 1 #言語
    end
    
    trait :os do
      category 2 #OS
    end
    
    trait :db do
      category 3 #DB
    end
    
    trait :Middleware do
      category 4 #ミドルウェア
    end
    
    trait :Hardware do
      category 5 #ハードウェア
    end
    
    factory :skill_ruby do
      name "Ruby"
      programming
    end
    
    factory :skill_rails do
      name "Ruby on Rails"
      programming
    end
    
    factory :skill_java do
      name "java"
      programming
    end
    
    factory :skill_android do
      name "Android Apps"
      programming
    end
    
    factory :skill_objective_c do
      name "Objective-C"
      programming
    end
    
    factory :skill_javascrirpt do
      name "javascript"
      programming
    end
    
    factory :skill_vb_asp do
     name "asp.net"
     programming
   end
   
    factory :skill_vb do
      name "Visual Basic .NET"
      programming
    end
    
    factory :skill_oracle do 
      name "Oracle Database"
      db
    end
    
    factory :skill_sqlserver do
      name "SQL Server"
      db
    end
    
    factory :skill_mysql do 
      name "MySQL"
      db
    end
    
    factory :skill_hadoop do
      name "Hadoop"
      db
    end
    
    factory :skill_win_server do
      name "Windows Server"
      os
    end
    
    factory :skill_linux do
      name "Linux"
      os
    end
    
    factory :skill_aix do
      name "AIX"
      os
    end
  end
end

