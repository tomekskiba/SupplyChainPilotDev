require 'test_helper'

class PatientControllerTest < ActionController::TestCase
  test "should get order_form" do
    get :order_form
    assert_response :success
  end

end
