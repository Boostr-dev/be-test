class AddDepartments < ActiveRecord::Migration[7.0]
  def change
    create_table :departments do |t|
      t.belongs_to :company, null: false
      t.belongs_to :manager
      t.boolean :active, default: false, null: false
      t.string :name, null: false
      t.decimal :budget, null: false, default: 0
      t.integer :employee_count, null: false, default: 0
    end
  end
end
