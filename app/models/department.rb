class Department < ApplicationRecord
  belongs_to :company
  belongs_to :manager, class_name: 'Employee', optional: true

  has_many :employees

  validates :name, presence: true
  validates :manager, presence: true, if: :active?
end