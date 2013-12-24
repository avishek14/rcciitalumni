require 'test_helper'

class SiteControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get contact" do
    get :contact
    assert_response :success
  end

  test "should get pdesk" do
    get :pdesk
    assert_response :success
  end

  test "should get feedback" do
    get :feedback
    assert_response :success
  end

end
