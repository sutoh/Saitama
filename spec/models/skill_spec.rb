# coding: utf-8
require 'spec_helper'

describe Skill do
  context "データが存在しない時" do
    subject { Skill.all }
    its (:size) { should eq 0 }
    it ("データが空である事") { expect(subject).to be_empty }
  end
  
  context "データが存在する時" do
    subject { FactoryGirl.create_list(:skill, 3, :programming, :os, :db)}
    it ("データが空でない事") { expect(subject).not_to be_empty }
    its (:size) { should eq 3 }
  end

  describe "with RelationTest" do
    context "have_manyの確認" do
      it { should have_many(:employee_skills)}
      it { should have_many(:work_skills) }
    end
  end

  describe "with MethodsTest" do
  	describe "category_name" do
      context "category: 1が入っている場合" do
        let(:skill_ruby){ FactoryGirl.create :skill_ruby }
        subject { skill_ruby.category_name }
        it ("nullでない事") { expect(subject).not_to be_nil }
        it ("正常に出力される事") { expect(subject).to eq "言語" }
      end
    end
  end

  describe "カラム毎のテスト" do
  	subject { FactoryGirl.create(:skill_ruby, hash) }

  	describe "#category" do
      let(:hash){ {} }
      let(:column){subject.category}

      context "登録が成功した場合" do
        it ("カテゴリーが言語である事"){ expect(column).to eq 1 }
        it_should_behave_like 'Column_is_not_nil_and_numeric'
        it { should validate_numericality_of(:category) }
      end

      describe 'Validation Test' do
        context "範囲外の登録をした場合" do
          let(:hash){ {category: 9} }
          it_should_behave_like 'Validation failed'
        end
      end
    end

    describe "#name" do
      let(:hash){ {} }
      let(:column){subject.name}

      context "登録が成功した場合" do
        it { expect(column).to eq 'ruby' }
        it_should_behave_like 'Column_is_not_nil_and_string'
        it { should validate_presence_of(:name) }
      end

      describe 'Validation Test' do
      	context "nilの場合" do
          let(:hash){ {name: nil} }
          it_should_behave_like 'Validation failed'
        end
      end
    end

    describe "#note" do
      let(:hash){ {} }
      let(:column){subject.note}

      context "登録が成功した場合" do
        it { expect(column).to eq 'none' }
        it_should_behave_like 'Column_is_not_nil_and_string'
      end
    end
  end

end
