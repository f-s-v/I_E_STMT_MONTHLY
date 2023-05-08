json.extract! statement_line, :id, :amount, :user_id, :kind, :created_at, :updated_at
json.url statement_line_url(statement_line, format: :json)
