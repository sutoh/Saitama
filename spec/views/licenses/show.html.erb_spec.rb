require 'spec_helper'

describe "licenses/show" do
  before(:each) do
    @license = assign(:license, stub_model(License))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
