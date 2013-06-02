# -*- encoding: utf-8 -*-
require 'spec_helper'

describe EmployeeSkill do
  share_examples_for 'Validation successfull' do
    it ("エラーが発生しないこと") {expect{subject}.not_to raise_error}
    it ("登録されること") { expect(subject).to be_true }
  end

  share_examples_for 'Validation failed' do
    it {expect{subject}.to raise_error}
  end

  share_examples_for 'Column_is_not_nil_and_numeric' do
    it ("Nullでない事") { expect(column).not_to be_nil }
    it ("Numericである事") { expect(column).to be_a_kind_of(Numeric) }
  end

  context "データが存在しない時" do
    subject { EmployeeSkill.all }
    its (:size) { should eq 0 }
    it ("データが空である事") { expect(subject).to be_empty }
  end
  
  describe "with RelationTest" do  
    context "belong_toの確認" do
      it { should belong_to(:employee) }
      it { should belong_to(:skill) }
    end
  end

  describe "カラム毎のテスト" do
    subject { FactoryGirl.create(:employee_skill_first,hash) }

    describe "#level" do
      let(:hash){ {} }
      let(:column){subject.level}

      context "登録が成功した場合" do
        it { expect(column).to eq 2 }
        it_should_behave_like 'Column_is_not_nil_and_numeric'
        it { should validate_numericality_of(:level) }
      end

      describe 'Validation Test' do
        context "範囲外の登録をした場合" do
          let(:hash){ {level: 6} }
          it_should_behave_like 'Validation failed'
        end
      end
    end
  end
end
