require "test_helper"

class StatementLinesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @statement_line = statement_lines(:one)
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
      post statement_lines_url, params: { statement_line: { amount: @statement_line.amount, kind: @statement_line.kind, user_id: @statement_line.user_id } }
    end

    assert_redirected_to statement_line_url(StatementLine.last)
  end

  test "should show statement_line" do
    get statement_line_url(@statement_line)
    assert_response :success
  end

  test "should get edit" do
    get edit_statement_line_url(@statement_line)
    assert_response :success
  end

  test "should update statement_line" do
    patch statement_line_url(@statement_line), params: { statement_line: { amount: @statement_line.amount, kind: @statement_line.kind, user_id: @statement_line.user_id } }
    assert_redirected_to statement_line_url(@statement_line)
  end

  test "should destroy statement_line" do
    assert_difference("StatementLine.count", -1) do
      delete statement_line_url(@statement_line)
    end

    assert_redirected_to statement_lines_url
  end
end
