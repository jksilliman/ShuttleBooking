require 'test_helper'

class ShuttlesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get select" do
    get :select
    assert_response :success
  end

end
