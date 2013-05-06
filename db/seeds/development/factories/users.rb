# -*- encoding: UTF-8 -*-

def split_email(email)
  _ = email =~ /@/
  unless _.nil? || _==0
    $`
  else
    email
  end
end

FactoryGirl.define do
  
  # Factories of Users
  factory :user do
    password 'saitama'
    password_confirmation 'saitama'
    login_id { "#{split_email(email)}" }
    
    # role
    trait :admin do
      role_id 1
    end
  
    trait :power_user do
      role_id 0
    end
  
    factory :user_admin do
      email 'rubeus@human-net.co.jp'
      admin
    end
  
    factory :user_maeda do
      email 'maeda.takuya@human-net.co.jp'
      admin
    end
  
    factory :user_yawata do
      email 'yawata.yutaka@human-net.co.jp'
      admin
    end
  
    factory :user_lee do
      email 'lee.jisun@human-net.co.jp'
      admin
    end
    
    factory :user_oizumi do
      email 'oizumi.kosuke@human-net.co.jp'
      admin
    end
  
    factory :user_kashiyama do 
      email 'kashiyama.koichi@human-net.co.jp'
      admin
    end
  
    factory :user_sutoh do 
      email 'sutoh.shohei@human-net.co.jp'
      admin
    end
  
    factory :user_test01 do
      email 'test01@human-net.co.jp'
      power_user
    end
  end
  
  # Factories of Department
  factory :department do
    
    factory :software_deptdo do
      name "Software Solution"
    end

    factory :technical_dept do
      name "Technical Solution"
    end

    factory :customer_dept do
      name "Customer Solution"
    end

    factory :trd_dept do
      name "TRD"
    end
  end
  
  #Factories of Employees
  factory :employee do
    postalcode "101-0054"
    address "東京都千代田区神田錦町1-21-1"
    station "神田"
    education "東京大学"
    self_pr "がんばります。"
    tech_flg 1
    staff_flg 1
    del_flg 0
    
    factory :employee_admin do 
      family_name "Saitama"
      given_name "Taro"
      family_name_kana "Saitama"
      given_name_kana "Taro"
      gender 0
      birthday "2000/03/01"
      experience 3
      entrance_date "2013/04/01"
      department_id { Department.where(name: "Customer Solution").first.id }
      user_id { User.where(login_id: "rubeus").first.id }
    end
    
    factory :employee_sutoh do
      family_name "Staitama"
      given_name "Jiro"
      family_name_kana "Staitama"
      given_name_kana "Jiro"
      gender 0
      birthday "2000/03/02"
      experience 3
      entrance_date "2013/04/02"
      department_id { Department.where(name: "Technical Solution").first.id }
      user_id { User.where(login_id: "sutoh.shohei").first.id }
    end
    
    factory :employee_maeda do
      family_name "Staitama"
      given_name "Saburo"
      family_name_kana "Staitama"
      given_name_kana "Saburo"
      gender 0
      birthday "2000/03/03"
      experience 3
      entrance_date "2013/04/03"
      department_id { Department.where(name: "Technical Solution").first.id }
      user_id { User.where(login_id: "maeda.takuya").first.id }
      
    end
    
    factory :employee_yawata do
      family_name "Staitama"
      given_name "Siro"
      family_name_kana "Staitama"
      given_name_kana "Siro"
      gender 0
      birthday "2000/03/04"
      experience 3
      entrance_date "2013/04/04"
      department_id { Department.where(name: "TRD").first.id }
      user_id { User.where(login_id: "yawata.yutaka").first .id}
    end
    
    factory :employee_oizumi do
      family_name "Staitama"
      given_name "Goro"
      family_name_kana "Staitama"
      given_name_kana "Goro"
      gender 0
      birthday "2000/03/05"
      experience 3
      entrance_date "2013/04/05"
      department_id { Department.where(name: "Software Solution").first.id }
      user_id { User.where(login_id: "oizumi.kosuke").first.id }
      
    end
    
    factory :employee_kashiyama do
      family_name "Staitama"
      given_name "Rokuro"
      family_name_kana "Staitama"
      given_name_kana "Rokuro"
      gender 0
      birthday "2000/03/06"
      experience 3
      entrance_date "2013/04/06"
      department_id { Department.where(name: "Customer Solution").first.id }
      user_id { User.where(login_id: "kashiyama.koichi").first.id }
    end
    
    factory :employee_lee do
      family_name "Staitama"
      given_name "Nanao"
      family_name_kana "Staitama"
      given_name_kana "Nanao"
      gender 1
      birthday "2000/03/07"
      experience 3
      entrance_date "2013/04/07"
      department_id { Department.where(name: "Software Solution").first.id }
      user_id { User.where(login_id: "lee.jisun").first.id }
    end
    
    factory :employee_test01 do
      family_name "Staitama"
      given_name "Hachiro"
      family_name_kana "Staitama"
      given_name_kana "Hachiro"
      gender 1
      birthday "2000/03/07"
      experience 3
      entrance_date "2013/04/07"
      department_id { Department.where(name: "Software Solution").first.id }
      user_id { User.where(login_id: "test01").first.id }
    end
    
  end
end
