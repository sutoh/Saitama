require 'spec_helper'

describe "licenses/index" do
  before(:each) do
    assign(:licenses, [
      stub_model(License),
      stub_model(License)
    ])
  end

  it "renders a list of licenses" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
