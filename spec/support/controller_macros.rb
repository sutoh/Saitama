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
  def sign_in_user
    @user = FactoryGirl.create(:user)
    post_via_redirect user_session_path, 'user[login_id]' => @user.login_id, 'user[password]' => @user.password
  end
end