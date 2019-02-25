class CreateEmployees < ActiveRecord::Migration[5.1]
  def change
    create_table :employees do |t|
      t.string :first_name
      t.string :last_name
      t.date :hire_date
      t.date :termination_date
      t.boolean :is_manager
      t.text :notes

      t.timestamps
    end
  end
end
