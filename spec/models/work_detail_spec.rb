# coding: utf-8
require 'spec_helper'

describe WorkDetail do
  context "データが存在しない時" do
    subject { WorkDetail.all }
    its (:size) { should eq 0 }
    it ("データが空である事") { expect(subject).to be_empty }
  end
  
  context "データが存在する時" do
    subject { FactoryGirl.create_list(:work_detail, 3, :detail1, :detail2, :detail3) }
    it ("データが空でない事") { expect(subject).not_to be_empty }
    its (:size) { should eq 3 }
  end

  describe "with RelationTest" do
    context "have_manyの確認" do
      it { should have_many(:work_skills) }
    end
  
    context "belong_toの確認" do
      it { should belong_to(:work) }
    end
  end

  describe "with MethodsTest" do
    #Methodテスト
    describe "job_short_name method" do
    	context "job_class へ 1 を入れた場合" do
        before { FactoryGirl.create :work_detail1 }
        subject{WorkDetail.where("job_class = ?", 1).first.job_short_name}
      
        it ("nullでない事") { expect(subject).not_to be_nil }
        it ("正常に出力される事") { expect(subject).to eq "PM" }
      end 

      context "job_class へ 範囲外の数字(0) を入れた場合" do
        before { FactoryGirl.create :work_detail1, {job_class: 0} }
        subject{WorkDetail.where("job_class = ?", 0).first.job_short_name}
      
        it ("値がかえらない事") { expect(subject).to eq "" }
      end 
    end
  end

  describe "カラム毎のテスト" do
    subject { FactoryGirl.create(:work_detail1,hash) }

    describe "#job_class" do
    	let(:hash){ {} }
      let(:column){subject.job_class}

      context "登録が成功した場合" do
        it { expect(column).to eq 1 }
        it_should_behave_like 'Column_is_not_nil_and_numeric'
      end
    end

    describe "#period_form" do
    	let(:hash){ {} }
      let(:column){subject.period_form}

      context "登録が成功した場合" do
        it { expect(column).to eq Date::new(2013, 4, 1) }
        it_should_behave_like 'Column_is_not_nil_and_date'
      end
    end

    describe "#period_to" do
    	let(:hash){ {} }
      let(:column){subject.period_to}

      context "登録が成功した場合" do
        it { expect(column).to eq Date::new(2013, 5, 1) }
        it_should_behave_like 'Column_is_not_nil_and_date'
      end
    end

    describe "#personnel_num" do
    	let(:hash){ {} }
      let(:column){subject.personnel_num}

      context "登録が成功した場合" do
        it { expect(column).to eq 2 }
        it_should_behave_like 'Column_is_not_nil_and_numeric'
      end
    end

    describe "#role" do
    	let(:hash){ {} }
      let(:column){subject.role}

      context "登録が成功した場合" do
        it { expect(column).to eq "PG" }
        it_should_behave_like 'Column_is_not_nil_and_string'
      end
    end

    describe "#subject" do
    	let(:hash){ {} }
      let(:column){subject.subject}

      context "登録が成功した場合" do
        it { expect(column).to eq "一般ユーザ向けECサイト開発" }
        it_should_behave_like 'Column_is_not_nil_and_string'
      end
    end

    describe "#title" do
    	let(:hash){ {} }
      let(:column){subject.title}

      context "登録が成功した場合" do
        it { expect(column).to eq "①一般ユーザ向けECサイト開発作業\n②プロジェクトリーダとして要件定義および設計を担当\n③現行業務のヒアリング、要件の整理、基本設計の作成、\n　開発作業における課題の管理、ユーザとの折衝を担当。\n　ECサイトは社内パッケージを用いて、カスタマイズにより実装。\n　コーディングはSQL作成と、ビジネスロジック作成のみ経験。" }
        it_should_behave_like 'Column_is_not_nil_and_string'
      end
    end

    describe "#work_class" do
    	let(:hash){ {} }
      let(:column){subject.work_class}

      context "登録が成功した場合" do
        it { expect(column).to eq 1 }
        it_should_behave_like 'Column_is_not_nil_and_numeric'
      end
    end

    describe "#work_id" do
    	let(:hash){ {} }
      let(:column){subject.work_id}

      context "登録が成功した場合" do
        it { expect(column).to eq 1 }
        it_should_behave_like 'Column_is_not_nil_and_numeric'
      end
    end

    describe "#work_role" do
    	let(:hash){ {} }
      let(:column){subject.work_role}

      context "登録が成功した場合" do
        it { expect(column).to eq 1 }
        it_should_behave_like 'Column_is_not_nil_and_numeric'
      end
    end
  end
end
