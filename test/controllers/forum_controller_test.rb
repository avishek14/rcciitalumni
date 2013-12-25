require 'test_helper'

class ForumControllerTest < ActionController::TestCase
  test "should get main" do
    get :main
    assert_response :success
  end

  test "should get topic" do
    get :topic
    assert_response :success
  end

  test "should get post" do
    get :post
    assert_response :success
  end

end
