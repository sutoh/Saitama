#coding: utf-8

regist_data_user = {
  email: 'rubeus@human-net.co.jp', 
  password: 'rubeus', 
  password_confirmation: 'rubeus', 
  login_id: 'admin',
  role: 1,
}

User.create(regist_data_user, without_protection: true)




