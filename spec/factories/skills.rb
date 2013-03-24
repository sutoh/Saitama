# -*- encoding: utf-8 -*-
FactoryGirl.define do
  factory :skill do
    name "skill"
    category 0
    note "none"
    
    trait :ruby do
      name "ruby"
    end
    trait :rails do
      name "rails"
      note "Ruby On Rails"
    end
    trait :java do
      name "java"
    end
    trait :android do
      name "android app"
    end
    trait :vb do
      name "vb"
    end
    trait :javascript do
      name "javascript"
    end
    
    # 1:言語 
    # 2:OS
    # 3:DB
    # 4:ミドル
    # 5:機器(ハードウェア)
    trait :programming do
      category 1
    end
    trait :os do
      category 2
    end
    trait :db do
      category 3
    end
    trait :Middleware do
      category 4
    end
    trait :Hardware do
      category 5
    end
    
    factory :skill_ruby,    traits:[:ruby,:programming]
    factory :skill_rails,   traits:[:rails,:programming]
    factory :skill_java,    traits:[:java,:programming]
    factory :skill_android, traits:[:android,:programming]
    factory :skill_javascrirpt, traits:[:javascript,:programming]
    factory :skill_vb_asp,  traits:[:vb,:programming] {note "asp.net" }
    factory :skill_vb,      traits:[:vb,:programming] {note "vb.net" }
    factory :skill_vb_script, traits:[:vb,:programming] {note "vbscript" }
    factory :skill_vba,     traits:[:vb,:programming] {note "vba" }
    factory :skill_oracle,  traits:[:db] {name "oracle" }
    factory :skill_sqlserver, traits:[:db] {name "sqlserver" }
    factory :skill_mysql,   traits:[:db] {name "mysql" }
    factory :skill_hadoop,  traits:[:db] {name "hadoop" }
    factory :skill_win_client, traits:[:os] {name "Windows XX " }
    factory :skill_win_server, traits:[:os] {name "Windows Server 20XX" }
    factory :skill_mac,     traits:[:os] {name "Mac OSX" }
    factory :skill_ubuntu,  traits:[:os] {name "Ubuntu" }
    factory :skill_linux,   traits:[:os] {name "Linux" }
    factory :skill_aix,     traits:[:os] {name "AIX" }
    
  end
end

