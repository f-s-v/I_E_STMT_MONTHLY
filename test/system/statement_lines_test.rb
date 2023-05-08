require "application_system_test_case"

class StatementLinesTest < ApplicationSystemTestCase
  setup do
    @statement_line = statement_lines(:one)
  end

  test "visiting the index" do
    visit statement_lines_url
    assert_selector "h1", text: "Statement lines"
  end

  test "should create statement line" do
    visit statement_lines_url
    click_on "New statement line"

    fill_in "Amount", with: @statement_line.amount
    fill_in "Kind", with: @statement_line.kind
    fill_in "User", with: @statement_line.user_id
    click_on "Create Statement line"

    assert_text "Statement line was successfully created"
    click_on "Back"
  end

  test "should update Statement line" do
    visit statement_line_url(@statement_line)
    click_on "Edit this statement line", match: :first

    fill_in "Amount", with: @statement_line.amount
    fill_in "Kind", with: @statement_line.kind
    fill_in "User", with: @statement_line.user_id
    click_on "Update Statement line"

    assert_text "Statement line was successfully updated"
    click_on "Back"
  end

  test "should destroy Statement line" do
    visit statement_line_url(@statement_line)
    click_on "Destroy this statement line", match: :first

    assert_text "Statement line was successfully destroyed"
  end
end
