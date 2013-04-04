require 'spec_helper'

describe "Licenses" do
  describe "GET /licenses" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      sign_in_user
      get licenses_path
      response.status.should be(200)
    end
  end
end
