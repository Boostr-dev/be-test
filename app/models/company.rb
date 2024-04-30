class Company < ApplicationRecord
  has_many :departments, dependent: :destroy
  has_many :employees, dependent: :destroy
  has_many :managers, through: :departments
end