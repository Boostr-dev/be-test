class AddEmployees < ActiveRecord::Migration[7.0]
  def change
    create_table :employees do |t|
      t.belongs_to :company, null: false
      t.belongs_to :department, null: false
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.decimal :salary, null: false, default: 0
    end
  end
end
