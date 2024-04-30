class Employee < ApplicationRecord
  belongs_to :company
  belongs_to :department

  has_one :manager, through: :department
  has_one :managed_department, class_name: 'Department', foreign_key: 'manager_id'

  validates :first_name, :last_name, :salary, presence: true

  def manager?
    managed_department.present?
  end
end