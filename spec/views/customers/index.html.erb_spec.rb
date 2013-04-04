require 'spec_helper'

describe "customers/index" do
  before(:each) do
    assign(:customers, Kaminari.paginate_array([
        FactoryGirl.build_stubbed(:customer),
        FactoryGirl.build_stubbed(:customer)
      ]).page(1))
    assign(:controller, "customer".classify)
  end

  it "renders a list of customers" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
