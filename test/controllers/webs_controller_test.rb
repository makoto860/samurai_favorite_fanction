require "test_helper"

class WebsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get webs_index_url
    assert_response :success
  end
end
