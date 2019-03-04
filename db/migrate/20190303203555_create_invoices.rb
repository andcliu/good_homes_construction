class CreateInvoices < ActiveRecord::Migration[5.1]
  def change
    create_table :invoices do |t|
      t.float :amount_due
      t.date :due_date
      t.text :notes
      t.boolean :is_paid
      t.date :paid_date
      t.references :client, foreign_key: true
      t.references :milestone, foreign_key: true
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
