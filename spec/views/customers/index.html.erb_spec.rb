require 'spec_helper'

describe "customers/index" do
  before(:each) do
    assign(:customers, Kaminari.paginate_array([
        FactoryGirl.build_stubbed(:customer),
        FactoryGirl.build_stubbed(:customer)
      ]).page(1))
    view.stub(:controller_name).and_return("customer")
  end

  it "renders a list of customers" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
