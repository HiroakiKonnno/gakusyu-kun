require "test_helper"

class LoginPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get login_pages_top_url
    assert_response :success
  end
end
