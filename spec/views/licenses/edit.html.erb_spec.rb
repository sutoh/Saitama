require 'spec_helper'

describe "licenses/edit" do
  before(:each) do
    @license = assign(:license, stub_model(License))
  end

  it "renders the edit license form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", license_path(@license), "post" do
    end
  end
end
