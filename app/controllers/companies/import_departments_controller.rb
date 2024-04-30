module Companies
  class ImportDepartmentsController < ApplicationController
    def update
      import_departments
      sync_departments
    end

    def import_departments
      # CSV that imports a lot of employees and salaries updates for one company

      # company = Company.find(params[:company_id])
      # import CSV logic ...
    end

    def sync_departments
      # TODO: refactor - taking too much time and breaking sometimes
      Company.all.map do |company|
        company.departments.map do |department|
          department.update(employee_count: department.employees.count)
          department.update(budget: (department.employees.map(&:salary).sum) * 1.1)
        end
      end
    end
  end
end