# -*- encoding: utf-8 -*-
require 'spec_helper'

describe Employee do
  describe "gmaps4rails_address method" do
    before do
      employee = FactoryGirl.create(:employee_sutoh,address: 'Tokyo') 
      employee.save
    end
    let(:employee){ Employee.where("address = ?",'Tokyo').first}
    context "出力確認" do
      it ("not null") { employee.gmaps4rails_address.should_not be_nil }
      it ("正常出力") { employee.gmaps4rails_address.should == "Tokyo" }
    end 
  end
end
