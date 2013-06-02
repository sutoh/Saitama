# coding: utf-8
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

  share_examples_for 'Column_is_not_nil_and_date' do
    it ("Nullでない事") { expect(column).not_to be_nil }
    it ("Dateである事") { expect(column).to be_a_kind_of(Date) }
  end