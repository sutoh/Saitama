require 'spec_helper'

describe "employees/new" do
  before(:each) do
    assign(:employee, stub_model(Employee).as_new_record)
    @departments = Department.find(:all, :select => "Departments.name, Departments.id")
    view.stub(:legend_view).and_return("new Employee")
  end

  it "renders new employee form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", employees_path, "post" do
    end
  end
end
