class StatementLine < ApplicationRecord
  enum kind: { income: 0, expenditure: 1, debt: 2 }

  belongs_to :user

  validates :title, :user, :amount, :kind, presence: true
  validates :amount, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
