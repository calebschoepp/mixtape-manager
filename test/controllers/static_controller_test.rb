require "test_helper"

class StaticControllerTest < ActionDispatch::IntegrationTest
  test "should get landing" do
    get static_landing_url
    assert_response :success
  end

  test "should get help" do
    get static_help_url
    assert_response :success
  end
end
