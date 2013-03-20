# Read about factories at https//github.com/thoughtbot/factory_girl

FactoryGirl.define do

  # :user宣言のみ :class指定いらず
  factory :user do
    email 'rubeus@human-net.co.jp' 
    password 'rubeus' 
    password_confirmation 'rubeus' 
    login_id 'admin'
    role_id 1
  end

  # 任意の指定の場合、:class指定必要
  factory :sutoh, class: User do
    email 'sutoh.shohei@human-net.co.jp' 
    password 'rubeus' 
    password_confirmation 'rubeus' 
    login_id 'sutoh'
    role_id 1
  end
end
