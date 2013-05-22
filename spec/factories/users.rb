# Read about factories at https//github.com/thoughtbot/factory_girl
def split_email(email)
  _ = email =~ /@/
  unless _.nil? || _==0
    $`
  else
    email
  end
end

FactoryGirl.define do
  # :user宣言のみ :class指定いらず
  factory :user do
    email 'saitama@example.co.jp' 
    password 'saitama'
    password_confirmation 'saitama'
    login_id { "#{split_email(email)}" }
    role_id 0
    
    trait :admin do
      role_id 1
    end
    
    trait :rubeus do
      email 'rubeus@human-net.co.jp' 
      password 'rubeus' 
      password_confirmation 'rubeus' 
      login_id 'admin'
      admin
    end
    
    trait :email do
      email 'maeda@human-net.co.jp'
      login_id { "#{split_email(email)}" }
    end
    
    factory :user_admin, traits: [:admin]
    factory :user_maeda, traits: [:rubeus,:email]
    factory :user_yawata, traits: [:email] {email 'yawata@human-net.co.jp'}
    factory :user_lee, traits: [:rubeus,:email] {email "lee@human-net.co.jp"}
    factory :user_izumi, traits: [:rubeus,:email] {email "izumi@human-net.co.jp"}
    factory :user_kashiyama, traits: [:rubeus,:email] {email "mayashika@human-net.co.jp"}
  end

  factory :user_sutoh, class: User do
    email 'sutoh.shohei@human-net.co.jp' 
    password 'rubeus' 
    password_confirmation 'rubeus'
    login_id { "#{split_email(email)}" }
    role_id 1
  end

end
