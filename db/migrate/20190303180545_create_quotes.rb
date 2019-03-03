class CreateQuotes < ActiveRecord::Migration[5.1]
  def change
    create_table :quotes do |t|
      t.string :project_name
      t.float :estimate
      t.text :work_description
      t.boolean :is_approved?
      t.boolean :is_cancelled?
      t.date :date_approved
      t.date :date_cancelled
      t.references :client, foreign_key: true

      t.timestamps
    end
  end
end
