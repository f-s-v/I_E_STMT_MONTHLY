class StatementLine < ApplicationRecord
  enum kind: { income: 0, expenditure: 1, debt: 2 }
  belongs_to :user
end
