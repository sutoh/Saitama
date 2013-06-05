require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe EmployeesController do
  login_user

  # This should return the minimal set of attributes required to create a valid
  # Employee. As you add validations to Employee, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {  }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # EmployeesController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all employees as @employees" do
      employee = FactoryGirl.create :employee_sutoh
      get :index, {}, valid_session
      assigns(:employees).should eq([employee])
    end
  end

  describe "GET show" do
    it "assigns the requested employee as @employee" do
      employee = FactoryGirl.create :employee_sutoh
      get :show, {:id => employee.to_param}, valid_session
      profile = Profile.new(employee)
      assigns(:profile).id.should eq(profile.id)
    end
  end

  describe "GET new" do
    before { get :new, {}, valid_session }
    it "assigns a new employee as @employee" do
      assigns(:employee).should be_a_new(Employee)
    end
    it_should_behave_like 'Department_list_should_not_to_be_nil'
  end

  describe "GET edit" do
    let(:employee){ FactoryGirl.create :employee_sutoh }
    before { get :edit, {:id => employee.to_param}, valid_session }
    it "assigns the requested employee as @employee" do
      assigns(:employee).should eq(employee)
    end
    it_should_behave_like 'Department_list_should_not_to_be_nil'
  end

  describe "POST create" do
    context "with valid params" do
      let(:post_create) {post :create, {employee: FactoryGirl.attributes_for(:employee_maeda)}, valid_session}

      it "creates a new Employee" do
        expect { post_create }.to change(Employee, :count).by(1)
      end

      it "redirects to the created employee" do
        post_create
        response.should redirect_to(Employee.last)
      end

      describe "variables" do
        before{post_create}
        it "assigns a newly created employee as @employee" do
          assigns(:employee).should be_a(Employee)
          assigns(:employee).should be_persisted
        end
        it_should_behave_like 'Department_list_should_not_to_be_nil'
      end
    end

    context "with invalid params" do
      before do
        Employee.any_instance.stub(:save).and_return(false)
        post :create, {:employee => {  }}, valid_session
      end

      it "assigns a newly created but unsaved employee as @employee" do
        # Trigger the behavior that occurs when invalid params are submitted
        assigns(:employee).should be_a_new(Employee)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    context "with valid params" do
      let(:employee){ FactoryGirl.create :employee_sutoh }
      let(:put_update){ put :update, {:id => employee.to_param, :employee => valid_attributes}, valid_session }

      it "updates the requested employee" do
        # Assuming there are no other employees in the database, this
        # specifies that the Employee created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Employee.any_instance.should_receive(:update_attributes).with({ "these" => "params" })
        put :update, {:id => employee.to_param, :employee => { "these" => "params" }}, valid_session
      end

      it "redirects to the employee" do
        put_update
        response.should redirect_to(employee)
      end

      describe "variables" do
        before{ put_update }

        it "assigns the requested employee as @employee" do
          assigns(:employee).should eq(employee)
        end

        it_should_behave_like 'Department_list_should_not_to_be_nil'
      end
    end

    context "with invalid params" do
      it "assigns the employee as @employee" do
        employee = FactoryGirl.create :employee_sutoh
        # Trigger the behavior that occurs when invalid params are submitted
        Employee.any_instance.stub(:save).and_return(false)
        put :update, {:id => employee.to_param, :employee => {  }}, valid_session
        assigns(:employee).should eq(employee)
      end

      it "re-renders the 'edit' template" do
        employee = FactoryGirl.create :employee_sutoh
        # Trigger the behavior that occurs when invalid params are submitted
        Employee.any_instance.stub(:save).and_return(false)
        put :update, {:id => employee.to_param, :employee => {  }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested employee" do
      employee = FactoryGirl.create :employee_sutoh
      expect {
        delete :destroy, {:id => employee.to_param}, valid_session
      }.to change(Employee, :count).by(-1)
    end

    it "redirects to the employees list" do
      employee = FactoryGirl.create :employee_sutoh
      delete :destroy, {:id => employee.to_param}, valid_session
      response.should redirect_to(employees_url)
    end
  end

end
