class CreateWorkDays < ActiveRecord::Migration[5.1]
  def change
    create_table :work_days do |t|
      t.date :work_date
      t.text :notes

      t.timestamps
    end
  end
end
