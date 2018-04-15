require 'test_helper'

class Api::V1::User::VendorsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_v1_user_vendors_index_url
    assert_response :success
  end

end
