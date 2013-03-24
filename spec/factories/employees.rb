#coding: utf-8


FactoryGirl.define do
  dept_ruby = Department.where('name LIKE ?', '%技術%').first
  
  factory :employee do 
    family_name "Saitama"
    given_name "Taro"
    family_name_kana "Saitama"
    given_name_kana "Taro"
    gender 1
    birthday "1986/10/10"
    experience 3
    entrance_date "2009/04/01"
    postalcode "330-0855"
    address "Saitama"
    station "Kawagoe"
    education "aaaa"
    self_pr "wwwwww"
    tech_flg 1
    staff_flg 1
    del_flg 0
    association :department
    
    trait :rubeus do
      family_name "rubeus"
      given_name "Taro"
      family_name_kana "rubeus"
      given_name_kana "Taro"
      gender 1
      birthday "2013/03/03"
      experience 3
      entrance_date "2009/04/01"
      postalcode "330-0855"
      address "Saitama"
      station "Kawagoe"
      education "aaaa"
      self_pr "wwwwww"
      tech_flg 1
      staff_flg 1
      del_flg 0
      department Department.where('name LIKE ?', '%Ruby%').first
    end
    
    trait :sutoh do
      family_name "sutoh"
      given_name "shohei"
      family_name_kana "ストウ"
      given_name_kana "ショウヘイ"
      gender 1
      birthday "1986/03/12"
      experience 3
      entrance_date "2009/04/01"
      postalcode "330-0926"
      address "Saitama"
      station "Urawa"
      education "aaaa"
      self_pr "wwwwww"
      tech_flg 1
      staff_flg 1
      del_flg 0
    end
    
    trait :maeda do
      family_name "前田"
      given_name "Taro"
      family_name_kana "マエダ"
      given_name_kana "Taro"
      gender 1
      birthday "2013/03/03"
      experience 3
      entrance_date "2009/04/01"
      postalcode "330-0855"
      address "Saitama"
      station "Kawagoe"
      department dept_ruby
    end
    
    trait :yawata do
      family_name "Yawata"
      given_name "Taro"
      family_name_kana "ヤワタ"
      given_name_kana "Taro"
      gender 1
      birthday "2013/03/03" 
    end
    
    factory :employee_sutoh, traits: [:sutoh]
    factory :employee_maeda, traits: [:maeda]
    factory :employee_yawata, traits: [:yawata]
  end

end
