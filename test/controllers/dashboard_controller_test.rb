require 'test_helper'

class DashboardControllerTest < ActionController::TestCase
	
	test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ads)
  end

end
