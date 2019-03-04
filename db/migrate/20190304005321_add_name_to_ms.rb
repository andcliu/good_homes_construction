class AddNameToMs < ActiveRecord::Migration[5.1]
  def change
    add_column :milestones, :name, :string
  end
end
