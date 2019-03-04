class ChangeEmployeeIdPlural < ActiveRecord::Migration[5.1]
  def change
  	rename_column :milestones, :employee_id, :employee_ids
    end
end
