require 'test_helper'

class CourseControllerTest < ActionController::TestCase
  test "should get eval" do
    get :eval
    assert_response :success
  end

  test "should get announce" do
    get :announce
    assert_response :success
  end

end
