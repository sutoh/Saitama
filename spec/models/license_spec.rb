# -*- encoding: utf-8 -*-
require 'spec_helper'

describe License do

  context "データが存在しない時" do
    subject { License.all }
    its (:size) { should eq 0 }
    it ("データが空である事") { expect(subject).to be_empty }
  end
  
  context "データが存在する時" do
    subject { FactoryGirl.create_list(:license, 3, :silver, :gold, :bronze) }
    it ("データが空でない事") { expect(subject).not_to be_empty }
    its (:size) { should eq 3 }
  end

  describe "with RelationTest" do
    context "have_manyの確認" do
      it { should have_many(:employee_licenses) }
    end
  end

  describe "カラム毎のテスト" do
    subject { FactoryGirl.create(:license,hash) }

    describe "#name" do
      let(:hash){ {} }
      let(:column){subject.name}

      context "登録が成功した場合" do
        it { expect(column).to eq 'License name' }
        it_should_behave_like 'Column_is_not_nil_and_string'
        it { should validate_presence_of(:name) }
      end

      describe 'Validation Test' do
        context "最大文字数で登録した場合" do
          let(:hash){ {name: '1234567890' * 5} }
          let(:len){ subject.name.length }
          it_should_behave_like 'Validation successfull'
          it ("50文字であること") { expect(len).to eq 50 }
        end

        context "最大文字数超で登録した場合" do
          let(:hash){ {name: '1234567890' * 5 + '1'} }
          it_should_behave_like 'Validation failed'
        end

        context "最小文字数以内で登録した場合" do
          let(:hash){ {name: 's'} }
          let(:len){ subject.name.length }
          it_should_behave_like 'Validation successfull'
          it ("1文字であること") { expect(len).to eq 1 }
        end

        context "最小文字数超で登録した場合" do
          let(:hash){ {name: ''} }
          it_should_behave_like 'Validation failed'
        end

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
        it { expect(column).to eq 'License note' }
        it_should_behave_like 'Column_is_not_nil_and_string'
      end

      describe 'Validation Test' do
        context "最大文字数で登録した場合" do
          let(:hash){ {note: '1234567890' * 10} }
          let(:len){ subject.note.length }
          it_should_behave_like 'Validation successfull'
          it ("100文字であること") { expect(len).to eq 100 }
        end

        context "最大文字数超で登録した場合" do
          let(:hash){ {note: '1234567890' * 10 + '1'} }
          it_should_behave_like 'Validation failed'
        end
      end
    end

    describe "#publisher" do
      let(:hash){ {} }
      let(:column){subject.publisher}

      context "登録が成功した場合" do
        it { expect(column).to eq 'test' }
        it_should_behave_like 'Column_is_not_nil_and_string'
        it { should validate_presence_of(:publisher) }
      end

      describe 'Validation Test' do
        context "最大文字数で登録した場合" do
          let(:hash){ {publisher: '12345' * 5} }
          let(:len){ subject.publisher.length }
          it_should_behave_like 'Validation successfull'
          it ("50文字であること") { expect(len).to eq 25 }
        end

        context "最大文字数超で登録した場合" do
          let(:hash){ {publisher: '12345' * 5 + '1'} }
          it_should_behave_like 'Validation failed'
        end

        context "最小文字数以内で登録した場合" do
          let(:hash){ {publisher: 's'} }
          let(:len){ subject.publisher.length }
          it_should_behave_like 'Validation successfull'
          it ("1文字であること") { expect(len).to eq 1 }
        end

        context "最小文字数超で登録した場合" do
          let(:hash){ {publisher: ''} }
          it_should_behave_like 'Validation failed'
        end

        context "nilの場合" do
          let(:hash){ {publisher: nil} }
          it_should_behave_like 'Validation failed'
        end
      end
    end

    describe "#validity_term" do
      let(:hash){ {} }
      let(:column){subject.validity_term}

      context "登録が成功した場合" do
        it { expect(column).to eq '3year' }
        it_should_behave_like 'Column_is_not_nil_and_string'
      end

      describe 'Validation Test' do
        context "最大文字数で登録した場合" do
          let(:hash){ {validity_term: '1234567890'} }
          let(:len){ subject.validity_term.length }
          it_should_behave_like 'Validation successfull'
          it ("100文字であること") { expect(len).to eq 10 }
        end

        context "最大文字数超で登録した場合" do
          let(:hash){ {validity_term: '12345678901'} }
          it_should_behave_like 'Validation failed'
        end
      end
    end
  end
end
