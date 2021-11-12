require "test_helper"

class AthletesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get athletes_new_url
    assert_response :success
  end

  test "should get create" do
    get athletes_create_url
    assert_response :success
  end
end
