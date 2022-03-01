require "test_helper"

class PantriesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get pantries_show_url
    assert_response :success
  end
end
