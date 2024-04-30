require 'rails_helper'

RSpec.describe Companies::ImportDepartmentsController, type: :controller do
  describe '#update' do  
    let(:company) { Company.create!(name: 'Company Test') }
    let(:department) { Department.create!(company: company, name: Faker::Company.name) }

    before do
      5.times do
        Employee.create!(
          first_name: Faker::Name.first_name,
          last_name: Faker::Name.last_name,
          company: company,
          department: department,
          salary: 100 * rand(1..10)
        )
      end
    end

    
    it 'syncs company departments info' do
      put :update, params: { company_id: Company.first.id }

      expect(department.reload.employee_count).to eq(department.employees.count)
      expect(department.budget).to eq(department.employees.sum(:salary) * 1.1)
    end
  end
end
