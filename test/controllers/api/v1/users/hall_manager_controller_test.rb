require 'test_helper'

class Api::V1::Users::HallManagerControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get api_v1_users_hall_manager_create_url
    assert_response :success
  end

end
