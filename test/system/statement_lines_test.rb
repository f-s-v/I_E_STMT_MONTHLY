require "application_system_test_case"

class StatementLinesTest < ApplicationSystemTestCase
  class EmptyStatementTest < ApplicationSystemTestCase
    setup do
      sign_in users(:two)
    end

    test "empty statements" do
      sign_in users(:two)
      users(:two).statement_lines.destroy_all
      visit statement_lines_url
      assert_no_selector "h1", text: "YOUR GRADE IS"
      assert_selector "a", text: "+ ADD"
    end
  end

  class AccessRightStatementTest < ApplicationSystemTestCase
    setup do
      sign_in users(:two)
      @statement = statement_lines(:four, :five)
    end

    test "empty statements" do
      sign_in users(:two)
      visit statement_lines_url
      assert_selector "h1", text: "YOUR GRADE IS"
      assert_no_selector "td", text: "salary user 1"
      assert_selector "td", text: "salary user 2"
    end
  end

  setup do
    sign_in users(:one)
  end

  test "Test signed in user" do
    visit statement_lines_url
    assert_selector "h1", text: "YOUR GRADE IS C"
    assert_selector "h1", text: "YOUR DISPOSABLE INCOME IS 2350"
    assert_selector "table.statement-table td.title", text: "salary user 1"
    assert_selector "table.statement-table td.title", text: "income user 1"
    assert_selector "table.statement-table td.title", text: "expenditure user 1"
  end

  test "Add new line" do
    visit new_statement_line_url

    assert_changes -> { User.find(users(:one).id).statement_lines.size } do
      fill_in "Title", with: 'test line'
      fill_in "Amount", with: '1000'
      click_on "Create Statement line"
      assert_current_path statement_lines_path
    end
  end

  test "Delete line" do
    visit statement_lines_url
    assert_changes -> { User.find(users(:one).id).statement_lines.size } do
      first('td.delete button').click
      assert_current_path statement_lines_path
    end
  end
end
