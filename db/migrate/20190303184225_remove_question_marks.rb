class RemoveQuestionMarks < ActiveRecord::Migration[5.1]
  def change
    rename_column :quotes, :is_approved?, :is_approved
    rename_column :quotes, :is_cancelled?, :is_cancelled
  end
end
