class AddTitleToStatemenentLine < ActiveRecord::Migration[7.0]
  def change
    add_column :statement_lines, :title, :text
  end
end
