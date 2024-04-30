require 'rails_helper'

RSpec.describe Employee do
  let(:company) { Company.create!(name: 'Company Test') }
  let(:department) { Department.create!(company: company, name: 'Department Test') }
  let(:employee) do
    Employee.create!(first_name: 'John', last_name: 'Doe', salary: 1000, company: company, department: department)
  end

  describe "#manager?" do
    let(:manager) do
      Employee.create!(first_name: 'Manager', last_name: 'Boss', salary: 1000, company: company, department: department)
    end

    context 'when employee has no department' do
      before { department.update!(manager: manager) }

      it 'retuns is not manager' do
        expect(employee.manager?).to be_falsey
      end
    end

    context 'when employee has a department' do
      it 'retuns employee is manager' do
        expect(employee.manager?).to be_truthy
      end
    end
  end
end