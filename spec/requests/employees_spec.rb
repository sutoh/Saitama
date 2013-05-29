# -*- encoding: UTF-8 -*-
require 'spec_helper'

#テスト対象
describe "EmployeeRequest" do
  #状態・テスト条件(～した場合)
  context "ログイン済みで/employeeをGETした場合" do
    #テスト前に行う処理
    before do 
      sign_in_user
    end
    before do
      get employees_path
    end
    
    #テスト対象
    subject { response }
    #テスト
    it '正常であること' do
      status.should be(200)
    end
  end
  
  context "ログインせず、/employeeをGETした場合" do
    before { get employees_path }
    subject { response }
    it 'ユーザログインページへ転送されること' do
      status.should be(302)
    end
  end
end
