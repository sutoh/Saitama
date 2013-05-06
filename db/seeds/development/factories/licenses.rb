# -*- encoding: utf-8 -*-

FactoryGirl.define do
  factory :license do
    note "none"
    
    # Publisher
    trait :ruby_association do
      publisher "Ruby Association"
    end
    
    trait :rails_committee do
      publisher "Rails技術者認定試験運営委員会"
    end
    
    trait :oracle do
      publisher "Oracle"
    end
    
    trait :ipa do
      publisher "IPA"
    end
    
    # validity_term
    trait :y2_valid do
      validity_term "2 years"
    end
    
    trait :y3_valid do
      validity_term "3 years"
    end
    
    factory :ruby_silver do 
      name "Ruby Association Certified Ruby Programmer Silver"
      y3_valid 
      ruby_association
    end
    
    factory :ruby_gold do 
      name "Ruby Association Certified Ruby Programmer Gold"
      y3_valid 
      ruby_association
    end
    
    factory :rails_bronze do 
      name "Rails 3 Certified Programmer Bronze"
      y3_valid 
      ruby_association
    end
    
    factory :java_bronze do
      name "Oracle Certified Java Programmer, Bronze SE 7"
      y3_valid 
      oracle
    end
    
    factory :java_silver do
      name "Oracle Certified Java Programmer, Silver SE 7"
      y3_valid 
      oracle
    end
    
    factory :java_gold do
      name "Oracle Certified Java Programmer, Gold SE 7"
      y3_valid 
      oracle
    end
    
    factory :oracle_bronze do
      name "ORACLE MASTER Bronze Oracle Database 11g"
      y3_valid 
      oracle
    end
    
    factory :oracle_silver do
      name "ORACLE MASTER Silver Oracle Database 11g"
      y3_valid 
      oracle
    end
    
    factory :oracle_gold do
      name "ORACLE MASTER Gold Oracle Database 11g"
      y3_valid 
      oracle
    end
    
    factory :oracle_platinum do
      name "ORACLE MASTER Platinum Oracle Database 11g"
      y3_valid 
      oracle
    end
    
  end
end
