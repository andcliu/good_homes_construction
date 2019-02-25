class CreateClients < ActiveRecord::Migration[5.1]
  def change
    create_table :clients do |t|
      t.string :name
      t.string :address
      t.string :city
      t.integer :zipcode
      t.string :phone
      t.string :phone2
      t.string :email
      t.date :onboard_date
      t.text :notes

      t.timestamps
    end
  end
end
