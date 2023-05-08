class CreateStatementLines < ActiveRecord::Migration[7.0]
  def change
    create_table :statement_lines do |t|
      t.integer :amount
      t.references :user, null: false, foreign_key: true
      t.integer :kind

      t.timestamps
    end

    add_index :statement_lines, :kind
  end
end
