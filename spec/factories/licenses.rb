# -*- encoding: utf-8 -*-

FactoryGirl.define do
  factory :license do
    name "License name"
    validity_term "3year"
    publisher "test"
    note "License note"
    
    trait :ruby do
      name "Ruby"
    end
    
    trait :rails do
      name "Rails"
      validity_term "1year"
      note "Ruby on Rails"
    end
    
    trait :java do
      name "OJC-Java"
      note "5.0"
    end
    
    trait :oracle do
      name "ORACLE MASTER"
    end
    
    trait :version_1_4 do
      note "1.4"
    end
    
    trait :gold do
      note "Gold"
      validity_term '3年'
    end
    
    trait :silver do
      note "Silver"
      validity_term '3年'
    end
    
    trait :bronze do
      note "bronze"
      validity_term "1年"
    end
    
    factory :ruby_silver, traits: [:ruby, :silver]
    factory :ruby_gold, traits: [:ruby, :gold] {validity_term "5年"}
    factory :rails_bronze, traits: [:rails, :bronze]
    factory :java_1_4, traits: [:java, :version_1_4]
    factory :oracle_bronze, traits: [:oracle, :bronze]
  end
end
