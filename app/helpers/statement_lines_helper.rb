module StatementLinesHelper
  def statement_grade(statement)
    income_amount = statement["income"] ? statement["income"].map(&:amount).sum : 0
    expenditure_amount = statement["expenditure"] ? statement["expenditure"].map(&:amount).sum : 0
    
    ratio = if (income_amount > 0)
      expenditure_amount.to_f / income_amount * 100
    else
      100
    end

    @grade = case ratio
    when 0..10
      'A'
    when 10..30
      'B'
    when 30..50
      'C'
    else
      'D'
    end
  end
end
