class CreateMilestones < ActiveRecord::Migration[5.1]
  def change
    create_table :milestones do |t|
      t.date :start_date
      t.date :completion_date
      t.text :task_description
      t.text :notes
      t.text :employee_ids, array: true, default: []
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
