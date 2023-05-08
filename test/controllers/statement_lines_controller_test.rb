require "test_helper"

class StatementLinesControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:one)
    @statement_line = statement_lines(:one)
  end

  test "redirect anonymous" do 
    sign_out users(:one)
    get statement_lines_url
    assert_response :redirect
  end

  test "should get index" do
    get statement_lines_url
    assert_response :success
  end

  test "should get new" do
    get new_statement_line_url
    assert_response :success
  end

  test "should create statement_line" do
    assert_difference("StatementLine.count") do
      post statement_lines_url, params: { statement_line: { amount: @statement_line.amount, kind: @statement_line.kind, user_id: @statement_line.user_id, title: @statement_line.title } }
    end

    assert_redirected_to statement_lines_url
  end

  test "should destroy statement_line" do
    assert_difference("StatementLine.count", -1) do
      delete statement_line_url(@statement_line)
    end

    assert_redirected_to statement_lines_url
  end
end
