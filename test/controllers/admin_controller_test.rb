require 'test_helper'

class AdminControllerTest < ActionController::TestCase
  test "should get user_all" do
    get :user_all
    assert_response :success
  end

  test "should get user_one" do
    get :user_one
    assert_response :success
  end

  test "should get user_delete" do
    get :user_delete
    assert_response :success
  end

  test "should get gallery_upload" do
    get :gallery_upload
    assert_response :success
  end

  test "should get event_create" do
    get :event_create
    assert_response :success
  end

end
