# -*- encoding: utf-8 -*-
require 'spec_helper'

describe Employee,"with データ存在テスト:" do

  context "データが存在しない時" do
    subject { Employee.all }
    its (:size) { should eq 0 }
    it ("Employeeが空である事") { should be_empty }
  end
  
  context "データが存在する時" do
    subject { FactoryGirl.create_list(:employee, 3, :sutoh, :rubeus, :maeda) }
    it ("Employeeが空でない事") { should_not be_empty }
    its (:size) { should eq 3 }
  end
  
end
   
describe Employee,"with カラムテスト:" do

  subject { FactoryGirl.create(:employee_sutoh) }
  
  context "#family_name" do
    let(:column){subject.family_name}
    it { column.should eq 'sutoh' }
    it ("Nullでない事") { column.should_not be_nil }
    it ("Stringである事") { column.should be_an_instance_of(String) }
  end
  
  context "#given_name" do
    let(:column){subject.given_name}
    it { column.should eq 'shohei' }
    it ("Nullでない事") { column.should_not be_nil }
    it ("Stringである事") { column.should be_an_instance_of(String) }
  end
  
  context "#family_name_kana" do
    let(:column){subject.family_name_kana}
    it { column.should eq 'ストウ' }
    it ("Nullでない事") { column.should_not be_nil }
    it ("Stringである事") { column.should be_an_instance_of(String) }
  end
  
  context "#given_name_kana" do
    let(:column){subject.given_name_kana }
    it { column.should eq 'ショウヘイ' }
    it ("Nullでない事") { column.should_not be_nil }
    it ("Stringである事") { column.should be_an_instance_of(String) }
  end
  
  context "#gender" do
    let(:column){subject.gender}
    it ("男であること(1)"){ column.should eq 1 }
    it ("Nullでない事") { column.should_not be_nil }
    it ("Numericである事") { column.should be_a_kind_of(Numeric) }
  end
end

describe Employee, "with Validation(Setting)Test" do
  context "presence Check" do
    it { should validate_presence_of(:family_name) }
    it { should validate_presence_of(:given_name) }
    it { should validate_presence_of(:address) }
  end
  
  context "numericality Check" do
    it { should validate_numericality_of(:gender) }
    it { should validate_numericality_of(:experience) }
    it { should validate_numericality_of(:tech_flg) }
    it { should validate_numericality_of(:staff_flg) }
  end
end
describe Employee, "with Validation(Maximum and minimum)Test" do

  subject { FactoryGirl.create(:employee_sutoh,hash) }
  
  describe "最大文字数で登録した場合" do
    context "#family_name" do
      let(:hash){ {family_name: 'sutoh1234567890sutoh'} }
      let(:len){ subject.family_name.length }
      it ("20文字であること") { expect(len).to eq 20 }
    end
    
    context "#given_name" do
    end
    
  end
  
  describe "最大文字数超で登録した場合" do
    context "#family_name" do
      let(:hash){ {family_name: 'sutoh1234567890sutohX'} }
      it "エラーであること:(21文字)" do 
        expect{
          subject
        }.to raise_error
      end
    end
    
    context "#given_name" do
    end
    
  end
  
  describe "最小文字数以内で登録した場合" do
    context "#family_name" do
      let(:hash){ {family_name: 's'} }
      let(:len){ subject.family_name.length }
      it ("1文字であること") { expect(len).to eq 1 }
    end
    
    context "#given_name" do
    end
    
  end
  
  describe "最小文字数超で登録した場合" do
    context "#family_name" do
      let(:hash){ {family_name: ''} }
      it "エラーであること:(0文字)" do 
        expect{
          subject
        }.to raise_error
      end
    end
    
    context "#given_name" do
    end
    
  end
  
  describe "nilの場合" do
    context "#family_name" do
      let(:hash){ {family_name: nil} }
      it "エラーであること:presence" do 
        expect{
          subject
        }.to raise_error
      end
    end
    
    context "#given_name" do
    end
    
    context "#station" do
      let(:hash){ {station: nil} }
      let(:station){ subject.station }
      it "登録されること" do 
        expect(subject).to be_true
      end
      it ("nilであること") { expect(station).to be_nil }
    end
  end
  
end
  
describe Employee,"with RelationTest" do

  context "have_manyの確認" do
    it { should have_many(:licenses).through(:employee_licenses) }
    it { should have_many(:employee_skills) }
    it { should have_many(:skills).through(:employee_skills) }
    it { should have_many(:works) }
  end
  
  context "belong_toの確認" do
    it { should belong_to(:department) }
    it { should belong_to(:user) }
  end
  
end
  
describe Employee,"with MethodsTest" do
  #Methodテスト
  describe "gmaps4rails_address method" do
    context "Address へ Saitama を入れた場合" do
    
      before { FactoryGirl.create :employee_sutoh }
      
      let(:employee){ Employee.where("address = ?",'Saitama').first}
      it ("nullでない事") { employee.gmaps4rails_address.should_not be_nil }
      it ("正常に出力される事") { employee.gmaps4rails_address.should == "Saitama" }
      
    end 
  end
    
  describe "gmaps4rails_infowindow" do
  end
  
  describe "fullname" do
  end
  
  describe "fullname_kana" do
  end
  
  describe "nenrei" do
  end
  
  describe "gender_judge" do
  end
    
end
