require 'spec_helper'

describe EmployeeSkillsController do
	login_user

	before{
		@employee = FactoryGirl.create :employee_sutoh
    FactoryGirl.create :skill_ruby
	}
	let(:employee_id){{employee_id: @employee.to_param}}
	let(:employee_skill){ FactoryGirl.create :employee_skill1, employee_id: @employee.id }

  context 'with TemplateTest(valid params)' do
    render_views
    
    describe 'GET index' do
      before { get :index, employee_id }
      it { expect(response).to render_template("index") }
      it { expect(response.body).to match /#{@employee.fullname}/m }
    end

    describe 'GET new' do
      before { get :new, employee_id }
      it { expect(response).to render_template("new") }
      it { expect(response.body).to match /New employee_skill/m }
    end

    describe 'GET edit' do
      before { get :edit, employee_id.merge({id: employee_skill.to_param}) }
      it { expect(response).to render_template("edit") }
      it { expect(response.body).to match /#{employee_skill.skill.name}/m }
    end

    describe 'POST create' do
      before do
        
        post :create, employee_id.merge({employee_skill: { }})
      end
      it { expect(response).to render_template("new") }
      it { expect(response.body).to match /employee_skill/m }
      describe 'Ajax request' do
        before do
          xhr :post, "create", employee_id.merge({employee_skill: FactoryGirl.attributes_for(:employee_skill4).merge(employee_id: 1)})
        end
        it {expect(assigns(:employee_skill)).to be_persisted}
        it {response.should render_template('employee_skills/create') }
        it {response.headers['Content-Type'].should be_include("text/javascript") }
      end
    end
  end

  context 'with AssignsTest' do
		describe "GET index" do
			before do
    	  @employee_skill = FactoryGirl.create :employee_skill1, employee_id: @employee.id
      	get :index, employee_id
			end

    	it "@employee_skills" do
      	expect(assigns(:employee_skills)).not_to be_nil
    	end

    	it "@employee_skill" do
    		expect(assigns(:employee_skill)).to be_new_record
    	end

    	it "@employee" do
    		expect(assigns(:employee).id).to eq(@employee.id)
    	end

    	it "@skills" do
    		expect(assigns(:skills)).not_to be_nil
    	end
    end

    describe "GET new" do
      before { get :new, employee_id }
    	it "@employee_skill" do
    		expect(assigns(:employee_skill)).to be_new_record
    	end

    	it "@employee" do
    		expect(assigns(:employee).id).to eq(@employee.id)
    	end

    	it "@skills" do
    		expect(assigns(:skills)).not_to be_nil
    	end
    end

    describe "GET edit" do
      before { get :edit, employee_id.merge({id: employee_skill.to_param}) }
    	it "@employee_skill" do
    		expect(assigns(:employee_skill)).not_to be_new_record
    	end

    	it "@employee" do
    		expect(assigns(:employee).id).to eq(@employee.id)
    	end

    	it "@skills" do
    		expect(assigns(:skills)).not_to be_nil
    	end
    end

    describe "POST create" do
      before { get :create, employee_id.merge(employee_skill: {skill_id: 1, level: 2}.merge(employee_id)) }
    	it "@employee_skill" do
    		expect(assigns(:employee_skill)).to be_a(EmployeeSkill)
    		expect(assigns(:employee_skill)).to be_persisted
    	end

    	it "@employee" do
    		expect(assigns(:employee).id).to eq(@employee.id)
    	end

    	it "@skills" do
    		expect(assigns(:skills)).not_to be_nil
    	end
    end
  end
end