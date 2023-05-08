require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "redirect to statement for signed in user" do
    sign_in users(:one)
    get home_index_url
    assert_redirected_to statement_lines_url
  end

  test "get index for anonymous" do
    get home_index_url
    assert_response :success
  end
end
