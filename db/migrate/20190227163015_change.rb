class Change < ActiveRecord::Migration[5.1]
  def change
    rename_column :milestones, :employee_ids, :employee_id
  end
end
