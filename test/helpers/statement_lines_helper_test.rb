class StatementLinesHelperTest < ActionView::TestCase
  test "#statement_grade A" do
    statement = [
      StatementLine.new(kind: 'income', amount: 20000),
      StatementLine.new(kind: 'income', amount: 1000),
      StatementLine.new(kind: 'expenditure', amount: 1000),
      StatementLine.new(kind: 'expenditure', amount: 500),
    ]
    assert_equal statement_grade(statement.group_by {|s| s[:kind] }), 'A'

  end

  test "#statement_grade B" do
    statement = [
      StatementLine.new(kind: 'income', amount: 5000),
      StatementLine.new(kind: 'income', amount: 1000),
      StatementLine.new(kind: 'expenditure', amount: 1000),
      StatementLine.new(kind: 'expenditure', amount: 500),
    ]
    assert_equal statement_grade(statement.group_by {|s| s[:kind] }), 'B'
  end

  test "#statement_grade C" do
    statement = [
      StatementLine.new(kind: 'income', amount: 2000),
      StatementLine.new(kind: 'income', amount: 1000),
      StatementLine.new(kind: 'expenditure', amount: 1000),
      StatementLine.new(kind: 'expenditure', amount: 500),
    ]
    assert_equal statement_grade(statement.group_by {|s| s[:kind] }), 'C'
  end

  test "#statement_grade D" do
    statement = [
      StatementLine.new(kind: 'income', amount: 1000),
      StatementLine.new(kind: 'income', amount: 1000),
      StatementLine.new(kind: 'expenditure', amount: 1000),
      StatementLine.new(kind: 'expenditure', amount: 500),
    ]
    assert_equal statement_grade(statement.group_by {|s| s[:kind] }), 'D'
  end

  test "#statement_grade empty" do
    statement = []
    assert_equal statement_grade(statement.group_by {|s| s[:kind] }), 'D'
  end

  test "#statement_grade no income" do
    statement = [
      StatementLine.new(kind: 'expenditure', amount: 1000),
      StatementLine.new(kind: 'expenditure', amount: 500),
    ]
    assert_equal statement_grade(statement.group_by {|s| s[:kind] }), 'D'
  end

  test "#statement_grade no expenditure" do
    statement = [
      StatementLine.new(kind: 'income', amount: 1000),
      StatementLine.new(kind: 'income', amount: 1000),
    ]
    assert_equal statement_grade(statement.group_by {|s| s[:kind] }), 'A'
  end

  test "#statement_disposable_income" do
    statement = [
      StatementLine.new(kind: 'income', amount: 2000),
      StatementLine.new(kind: 'income', amount: 1000),
      StatementLine.new(kind: 'expenditure', amount: 1000),
      StatementLine.new(kind: 'expenditure', amount: 500),
    ]
    assert_equal statement_disposable_income(statement.group_by {|s| s[:kind] }), 1500
  end

  test "#statement_disposable_income empty" do
    statement = []
    assert_equal statement_disposable_income(statement.group_by {|s| s[:kind] }), 0
  end
end