require 'test_helper'

class ShelterControllerTest < ActionController::TestCase
  def setup
    @controller = ShelterController.new
  end

  test "should get index" do
    get :index
    assert_response :success
  end

end
