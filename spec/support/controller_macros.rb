module ControllerMacros
  def login_user
    before(:each) do
    	controller.stub(:authenticate_user!).and_return true
      @request.env["devise.mapping"] = Devise.mappings[:user]
      @user  = FactoryGirl.create(:user)
      sign_in @user
    end
  end
  def login_user_admin
    before(:each) do
      controller.stub(:authenticate_user!).and_return true
      @request.env["devise.mapping"] = Devise.mappings[:user]
      @user  = FactoryGirl.create(:user_admin)
      sign_in @user
    end
  end
end

module RequestMacros
  include Warden::Test::Helpers
  def sign_in_user
    user = FactoryGirl.create(:user)
    login_as user, scope: :user, :run_callbacks => false
  end
end