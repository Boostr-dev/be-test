# This file should contain all the record creation needed to seed the database with its default values.

company = Company.create!(name: 'Company Test')

10.times do
  department = Department.create!(company: company, name: Faker::Company.name)

  5.times do
    Employee.create!(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      company: company,
      department: department,
      salary: 1000 * rand(1..10)
    )
  end

  department.update!(
    manager: department.employees.order(salary: :desc).first,
    employee_count: department.employees.reload.count
  )
end