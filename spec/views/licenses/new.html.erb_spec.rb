require 'spec_helper'

describe "licenses/new" do
  before(:each) do
    assign(:license, stub_model(License).as_new_record)
  end

  it "renders new license form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", licenses_path, "post" do
    end
  end
end
