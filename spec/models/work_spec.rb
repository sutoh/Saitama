# coding: utf-8
require 'spec_helper'

describe Work do
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
    subject { Work.all }
    its (:size) { should eq 0 }
    it ("データが空である事") { expect(subject).to be_empty }
  end

  context "データが存在する時" do
    subject { FactoryGirl.create_list(:work, 3, :customer1, :customer2, :customer3) }
    it ("データが空でない事") { expect(subject).not_to be_empty }
    its (:size) { should eq 3 }
  end

  describe "with RelationTest" do
    context "have_manyの確認" do
      it { should have_many(:work_details) }
    end
  
    context "belong_toの確認" do
      it { should belong_to(:employee) }
      it { should belong_to(:customer) }
    end
  end

  describe "with MethodsTest" do
  end

  describe "カラム毎のテスト" do
    subject { FactoryGirl.create(:work1,hash) }

    describe "#employee_id" do
      let(:hash){ {} }
      let(:column){subject.employee_id}

      context "登録が成功した場合" do
        it { expect(column).to eq 1 }
        it_should_behave_like 'Column_is_not_nil_and_numeric'
      end
    end

    describe "#sales_staff_id" do
      let(:hash){ {} }
      let(:column){subject.sales_staff_id}

      context "登録が成功した場合" do
        it { expect(column).to eq 1 }
        it_should_behave_like 'Column_is_not_nil_and_numeric'
      end
    end

    describe "#customer_id" do
      let(:hash){ {} }
      let(:column){subject.customer_id}

      context "登録が成功した場合" do
        it { expect(column).to eq 1 }
        it_should_behave_like 'Column_is_not_nil_and_numeric'
      end
    end
  end
end