# coding: utf-8
require 'spec_helper'

describe WorkSkill do
  context "データが存在しない時" do
    subject { WorkSkill.all }
    its (:size) { should eq 0 }
    it ("データが空である事") { expect(subject).to be_empty }
  end

  context "データが存在する時" do
    subject { FactoryGirl.create_list(:work_skill, 3, :skill1, :skill2, :skill3) }
    it ("データが空でない事") { expect(subject).not_to be_empty }
    its (:size) { should eq 3 }
  end

  describe "with RelationTest" do
    context "belong_toの確認" do
      it { should belong_to(:skill) }
      it { should belong_to(:work_detail) }
    end
  end

  describe "with MethodsTest" do
  end

  describe "カラム毎のテスト" do
    subject { FactoryGirl.create(:work_skill1,hash) }

    describe "#skill_id" do
      let(:hash){ {} }
      let(:column){subject.skill_id}

      context "登録が成功した場合" do
        it { expect(column).to eq 1 }
        it_should_behave_like 'Column_is_not_nil_and_numeric'
      end

      describe 'Validation Test' do
        context "nilの場合" do
          let(:hash){ {skill_id: nil} }
          it_should_behave_like 'Validation failed'
        end
      end
    end

    describe "#work_detail_id" do
      let(:hash){ {} }
      let(:column){subject.work_detail_id}

      context "登録が成功した場合" do
        it { expect(column).to eq 1 }
        it_should_behave_like 'Column_is_not_nil_and_numeric'
      end

      describe 'Validation Test' do
        context "nilの場合" do
          let(:hash){ {work_detail_id: nil} }
          it_should_behave_like 'Validation failed'
        end
      end
    end
  end
end
