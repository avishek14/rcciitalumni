require 'test_helper'

class EventControllerTest < ActionController::TestCase
  test "should get event_all" do
    get :event_all
    assert_response :success
  end

  test "should get event_one" do
    get :event_one
    assert_response :success
  end

end
