class CreateEmployeeInformations < ActiveRecord::Migration[5.1]
  def change
    create_table :employee_informations do |t|
      t.date :dob
      t.string :address
      t.string :city
      t.integer :zipcode
      t.string :phone
      t.string :phone2
      t.string :email
      t.float :current_wage
      t.float :previous_wage
      t.references :employee, foreign_key: true

      t.timestamps
    end
  end
end
