# -*- encoding: utf-8 -*-
require 'spec_helper'

describe Employee do
  share_examples_for 'Validation successfull' do
    it ("エラーが発生しないこと") {expect{subject}.not_to raise_error}
    it ("登録されること") { expect(subject).to be_true }
  end

  share_examples_for 'Validation failed' do
    it {expect{subject}.to raise_error}
  end

  share_examples_for 'Column_is_not_nil_and_string' do
    it ("Nullでない事") { expect(column).not_to be_nil }
    it ("Stringである事") { expect(column).to be_an_instance_of(String) }
  end

  share_examples_for 'Column_is_not_nil_and_numeric' do
    it ("Nullでない事") { expect(column).not_to be_nil }
    it ("Numericである事") { expect(column).to be_a_kind_of(Numeric) }
  end

  context "データが存在しない時" do
    subject { Employee.all }
    its (:size) { should eq 0 }
    it ("データが空である事") { expect(subject).to be_empty }
  end
  
  context "データが存在する時" do
    subject { FactoryGirl.create_list(:employee, 3, :sutoh, :rubeus, :maeda) }
    it ("データが空でない事") { expect(subject).not_to be_empty }
    its (:size) { should eq 3 }
  end

  describe "with RelationTest" do
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
  
  describe "with MethodsTest" do
    #Methodテスト
    describe "gmaps4rails_address method" do
      context "Address へ Saitama を入れた場合" do
    
        before { FactoryGirl.create :employee_sutoh }
        subject{Employee.where("address = ?",'Saitama').first.gmaps4rails_address}
      
        it ("nullでない事") { expect(subject).not_to be_nil }
        it ("正常に出力される事") { expect(subject).to eq "Saitama" }
      
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

  describe "カラム毎のテスト" do
    subject { FactoryGirl.create(:employee_sutoh,hash) }

    describe "#family_name" do
      let(:hash){ {} }
      let(:column){subject.family_name}

      context "登録が成功した場合" do
        it { expect(column).to eq 'sutoh' }
        it_should_behave_like 'Column_is_not_nil_and_string'
        it { should validate_presence_of(:family_name) }
      end

      describe 'Validation Test' do
        context "最大文字数で登録した場合" do
          let(:hash){ {family_name: 'sutoh1234567890sutoh'} }
          let(:len){ subject.family_name.length }
          it_should_behave_like 'Validation successfull'
          it ("20文字であること") { expect(len).to eq 20 }
        end

        context "最大文字数超で登録した場合" do
          let(:hash){ {family_name: 'sutoh1234567890sutohX'} }
          it_should_behave_like 'Validation failed'
        end

        context "最小文字数以内で登録した場合" do
          let(:hash){ {family_name: 's'} }
          let(:len){ subject.family_name.length }
          it_should_behave_like 'Validation successfull'
          it ("1文字であること") { expect(len).to eq 1 }
        end

        context "最小文字数超で登録した場合" do
          let(:hash){ {family_name: ''} }
          it_should_behave_like 'Validation failed'
        end

        context "nilの場合" do
          let(:hash){ {family_name: nil} }
          it_should_behave_like 'Validation failed'
        end
      end
    end

    describe "#given_name" do
      let(:hash){ {} }
      let(:column){subject.given_name}

      context "登録が成功した場合" do
        it { expect(column).to eq 'shohei' }
        it_should_behave_like 'Column_is_not_nil_and_string'
        it { should validate_presence_of(:given_name) }
      end

      describe 'Validation Test' do
        context "最大文字数超で登録した場合" do
          let(:hash){ {given_name: 'sutoh1234567890sutohX'} }
          it_should_behave_like 'Validation failed'
        end

        context "最小文字数以内で登録した場合" do
          let(:hash){ {given_name: 's'} }
          let(:len){ subject.given_name.length }
          it_should_behave_like 'Validation successfull'
          it ("1文字であること") { expect(len).to eq 1 }
        end
      
        context "最小文字数超で登録した場合" do
          let(:hash){ {given_name: ''} }
          it_should_behave_like 'Validation failed'
        end
      
        context "nilの場合" do
          let(:hash){ {given_name: nil} }
          it_should_behave_like 'Validation failed'
        end
      end
    end

    describe "#family_name_kana" do
      let(:hash){ {} }
      let(:column){subject.family_name_kana}

      context "登録が成功した場合" do
        it { expect(column).to eq 'ストウ' }
        it_should_behave_like 'Column_is_not_nil_and_string'
      end
    end

    describe "#given_name_kana" do
      let(:hash){ {} }
      let(:column){subject.given_name_kana }

      context "登録が成功した場合" do
        it { expect(column).to eq 'ショウヘイ' }
        it_should_behave_like 'Column_is_not_nil_and_string'
      end
    end

    describe "#gender" do
      let(:hash){ {} }
      let(:column){subject.gender}

      context "登録が成功した場合" do
        it ("男であること(1)"){ expect(column).to eq 1 }
        it_should_behave_like 'Column_is_not_nil_and_numeric'
        it { should validate_numericality_of(:gender) }
      end

      describe 'Validation Test' do
        context "範囲外の登録をした場合" do
          let(:hash){ {gender: 2} }
          it_should_behave_like 'Validation failed'
        end
      end
    end

    describe "#address" do
      let(:hash){ {} }
      let(:column){subject.address}

      context "登録が成功した場合" do
        it { expect(column).to eq "Saitama" }
        it_should_behave_like 'Column_is_not_nil_and_string'
        it { should validate_presence_of(:address) }
      end
    end

    describe "#station" do
      let(:hash){ {} }
      let(:column){subject.station}

      context "登録が成功した場合" do
        it { expect(column).to eq "Urawa" }
        it_should_behave_like 'Column_is_not_nil_and_string'
      end

      describe 'Validation Test' do
        context "nilの場合" do
          let(:hash){ {station: nil} }
          it_should_behave_like 'Validation successfull'
          its (:station){ should be_nil }
        end
      end
    end

    describe "#experience" do
      let(:hash){ {} }
      let(:column){subject.experience}

      context "登録が成功した場合" do
        it { expect(column).to eq 3 }
        it_should_behave_like 'Column_is_not_nil_and_numeric'
        it { should validate_numericality_of(:experience) }
      end
    end

    describe "#tech_flg" do
      let(:hash){ {} }
      let(:column){subject.tech_flg}

      context "登録が成功した場合" do
        it { expect(column).to eq 1 }
        it_should_behave_like 'Column_is_not_nil_and_numeric'
        it { should validate_numericality_of(:tech_flg) }
      end
    end

    describe "#staff_flg" do
      let(:hash){ {} }
      let(:column){subject.staff_flg}

      context "登録が成功した場合" do
        it { expect(column).to eq 1 }
        it_should_behave_like 'Column_is_not_nil_and_numeric'
        it { should validate_numericality_of(:staff_flg) }
      end
    end
  end
end
