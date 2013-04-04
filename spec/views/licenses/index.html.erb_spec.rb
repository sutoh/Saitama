require 'spec_helper'

describe "licenses/index" do
  before(:each) do

    assign(:licenses, Kaminari.paginate_array([
      FactoryGirl.build_stubbed(:license),
      FactoryGirl.build_stubbed(:license)
    ]).page(1))
    assign(:controller, "customer".classify)
  end

  it "renders a list of licenses" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
