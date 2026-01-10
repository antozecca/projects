require "test_helper"

class AdministratorsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get administrators_new_url
    assert_response :success
  end
end
