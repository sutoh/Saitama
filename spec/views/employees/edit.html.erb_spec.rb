require 'spec_helper'

describe "employees/edit" do
  before(:each) do
    @employee = assign(:employee, stub_model(Employee))
    @departments = Department.find(:all, :select => "Departments.name, Departments.id")
    view.stub(:legend_view).and_return("edit Employee")
  end

  it "renders the edit employee form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", employee_path(@employee), "post" do
    end
  end
end
