require 'test_helper'

class AdminControllerTest < ActionController::TestCase
  test "should get list_users" do
    get :list_users
    assert_response :success
  end

  test "should get create_user" do
    get :create_user
    assert_response :success
  end

  test "should get edit_user" do
    get :edit_user
    assert_response :success
  end

end
