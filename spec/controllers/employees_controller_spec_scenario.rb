# -*- encoding:utf-8 -*-

require 'spec_helper'

describe EmployeesController do
  login_user
  def valid_attributes
    {  }
  end
  
  def valid_session
    {}
  end
  
  context 'with TemplateTest(invalid params)' do
    render_views
    let(:employee){ FactoryGirl.create :employee_sutoh }
    let(:employee_id){{id: employee.to_param}}
    
    describe 'GET index' do
      before { get :index, {}, valid_session }
      it_should_behave_like 'Response_to_render_templete_and_contents_match', "index", "社員"
    end
    describe 'GET show' do
      before { get :show, employee_id, valid_session }
      it_should_behave_like 'Response_to_render_templete_and_contents_match', "show", "profile"
    end
    describe 'GET new' do
      before { get :new, {}, valid_session }
      it_should_behave_like 'Response_to_render_templete_and_contents_match', "new", "社員"
    end
    describe 'GET edit' do
      before { get :edit, employee_id, valid_session }
      it_should_behave_like 'Response_to_render_templete_and_contents_match', "edit", "社員"
    end
    describe 'POST create' do
      before do
        Employee.any_instance.stub(:save).and_return(false)
        post :create, {:employee => {  }}, valid_session
      end
      it_should_behave_like 'Response_to_render_templete_and_contents_match', "new", "社員"
    end
  end
  
  context 'with RedirectTest(valid params)' do
    let(:employee){ FactoryGirl.create :employee_maeda }
    
    describe 'POST create' do
      before { post :create, params , valid_session}
      let(:params){ {employee: FactoryGirl.attributes_for(:employee_maeda)} }
      it "redirects to the created employee" do
        expect(subject).to redirect_to(Employee.last)
      end
    end
    
    describe 'PUT update' do
      before { put :update, params , valid_session}
      let(:params){ {:id => employee.to_param, :employee => valid_attributes} }
      it "redirects to the created employee" do
        expect(subject).to redirect_to(employee)
      end
    end
    
    describe 'DELETE destroy' do
      before { delete :destroy, params , valid_session}
      let(:params){ {:id => employee.to_param} }
      it "redirects to the created employee" do
        expect(subject).to redirect_to(employees_url)
      end
    end
  end
  
  context 'with ActionRequestTest' do
    
  end
  
  context 'with AssignsTest' do
    describe 'GET index' do
      before(:each) do 
        create
        get :index, {}, valid_session 
      end
      
      describe '@employees' do
        subject { assigns(:employees).size }
        let(:create) { FactoryGirl.create_list(:employee, size, :sutoh) }
        it_should_behave_like 'Index_is_size_check', 0
        it_should_behave_like 'Index_is_size_check', 3
      end
      
      describe '@json' do
        subject { assigns(:json) }
        let(:create) { FactoryGirl.create_list(:employee, size, :sutoh).to_gmaps4rails }
        it_should_behave_like 'Index_is_string_check', 0
        it_should_behave_like 'Index_is_string_check', 3
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
      describe "variables" do
        before{post :create, {employee: FactoryGirl.attributes_for(:employee_maeda)}}
        it "assigns a newly created employee as @employee" do
          assigns(:employee).should be_a(Employee)
          assigns(:employee).should be_persisted
        end
        it_should_behave_like 'Department_list_should_not_to_be_nil'
      end
    end
    
  end
end
  