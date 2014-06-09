require 'test_helper'

class UsersTimeControllerTest < ActionController::TestCase
  test "should get time_in" do
    get :time_in
    assert_response :success
  end

  test "should get time_out" do
    get :time_out
    assert_response :success
  end

end
