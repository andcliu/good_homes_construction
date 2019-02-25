class CreateWorkSchedules < ActiveRecord::Migration[5.1]
  def change
    create_table :work_schedules do |t|
      t.float :hours
      t.text :work_description
      t.text :notes
      t.references :employee, foreign_key: true
      t.references :client, foreign_key: true
      t.references :work_day, foreign_key: true

      t.timestamps
    end
  end
end
