require 'test_helper'

class UserControllerTest < ActionController::TestCase
  test "should get logger" do
    get :logger
    assert_response :success
  end

  test "should get login" do
    get :login
    assert_response :success
  end

  test "should get logout" do
    get :logout
    assert_response :success
  end

  test "should get register" do
    get :register
    assert_response :success
  end

  test "should get create" do
    get :create
    assert_response :success
  end

  test "should get page" do
    get :page
    assert_response :success
  end

  test "should get edit" do
    get :edit
    assert_response :success
  end

  test "should get delete" do
    get :delete
    assert_response :success
  end

end
