require 'test_helper'

class GalleryControllerTest < ActionController::TestCase
  test "should get gallery" do
    get :gallery
    assert_response :success
  end

  test "should get one_image" do
    get :one_image
    assert_response :success
  end

end
