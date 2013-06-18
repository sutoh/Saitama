require 'spec_helper'

describe "employees/show" do
  before(:each) do
  	employee = stub_model(Employee, FactoryGirl.attributes_for(:employee_maeda))
    @profile = assign(:profile, Profile.new(employee))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
