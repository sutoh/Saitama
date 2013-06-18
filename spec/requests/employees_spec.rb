# -*- encoding: UTF-8 -*-
require 'spec_helper'
#テスト対象
describe "EmployeesRequest" do

  describe "GET index" do
    subject { response.status }
    
    context "ログイン済み" do
      before { sign_in_user }
      before(:each) { get employees_path }
      it '正常であること' do
        expect(subject).to eq(200)
      end
    end
    
    context "ログインしない場合" do
      before(:each) { get employees_path }
      it 'ユーザログインページへ転送されること' do
        expect(subject).to eq(302)
      end
    end
  end
end
