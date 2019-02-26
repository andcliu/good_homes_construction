class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.string :name
      t.float :estimated_amount
      t.float :final_amount
      t.date :estimated_start_date
      t.date :actual_start_date
      t.date :completion_date
      t.boolean :is_completed
      t.string :blueprints_url
      t.integer :client_id

      t.timestamps
    end
    add_index :projects, :client_id
  end
end
