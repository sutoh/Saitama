# -*- encoding: UTF-8 -*-
FactoryGirl.define do
  
  trait :human do
    customer_id { Customer.where(name: "Human-net").first.id }
  end
  trait :google do
    customer_id { Customer.where(name: "Google Japan").first.id }
  end
  trait :apple do
    customer_id { Customer.where(name: "Apple Japan").first.id }
  end
  trait :line do
    customer_id { Customer.where(name: "LINE株式会社").first.id }
  end
  trait :amazon do
    customer_id { Customer.where(name: "Amazon Japan").first.id }
  end
  
  trait :lee do
    employee_id { Employee.where(user_id: 
                    User.where(login_id: "lee.jisun").first.id).first.id}
  end
  trait :maeda do
    employee_id { Employee.where(user_id: 
                    User.where(login_id: "maeda.takuya").first.id).first.id}
  end
  trait :yawata do
    employee_id { Employee.where(user_id: 
                    User.where(login_id: "yawata.yutaka").first.id).first.id}
  end
  
  trait :oizumi do
    employee_id { Employee.where(user_id: 
                    User.where(login_id: "oizumi.kosuke").first.id).first.id}
  end
  
  trait :kashiyama do
    employee_id { Employee.where(user_id: 
                    User.where(login_id: "kashiyama.koichi").first.id).first.id}
  end
  
  trait :sutoh do
    employee_id { Employee.where(user_id: 
                    User.where(login_id: "sutoh.shohei").first.id).first.id}
  end
  
  # Factories of Users
  factory :work do
    
    factory :lee_human do
      lee
      human
    end
    factory :lee_goole do
      google
      lee
    end
    factory :lee_apple do
      apple
      lee
    end
    factory :lee_line do
      line
      lee
    end
    factory :lee_amazon do
      amazon
      lee
    end
    
    
    factory :sutoh_apple do
      apple
      sutoh
    end
    factory :sutoh_line do
      line
      sutoh
    end
    factory :sutoh_amazon do
      amazon
      sutoh
    end
    
    factory :maeda_human do
      human
      maeda
    end
    factory :maeda_goole do
      google
      maeda
    end
    
    
    factory :yawata_goole do
      google
      yawata
    end
    factory :kashiyama_apple do
      apple
      kashiyama
    end
    factory :oizumi_line do
      line
      oizumi
    end
    
  end
  
  
  factory :work_detail do
    factory :lee_detail do
      work_id { Work.where("employee_id = ? and customer_id = ?",
                            Employee.where(user_id: 
                              User.where(login_id: "lee.jisun").first.id
                            ).first.id,
                            Customer.where(name: "Human-net").first.id).first.id}
      title 'てすと'
      subject 'てすと'
    end
  end
end
