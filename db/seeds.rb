# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'


50.times do
    Newuser.create(
        # username: Faker::Name.name,
        email: Faker::Internet.email,
        # phone: Faker::PhoneNumber.cell_phone,
        password: Faker::Internet.password(min_length: 8, max_length: 12, mix_case: true, special_characters: true),
        # f_name: Faker::Name.name,
        # l_name: Faker::Name.name,
        organization: Faker::Name.name

    )

end

50.times do
    user = Newuser.order('RANDOM()').first
    Project.create(
        project_name: Faker::Lorem.words(number: 2).join(' '),
        starting_date: Faker::Date.between(from: 1.year.ago, to: Date.today),
        ending_date: Faker::Date.forward(days: 30),
        newusers_id: user.id
  )


end


50.times do

    project = Project.order('RANDOM()').first
    # random_integer = rand(10)
    Task.create(

        task_type: ["feature", "bug"].sample,
        ending_date: Faker::Date.forward(days: 30),
        description: Faker::Lorem.sentence,
        ticketNo: Faker::Number.number(digits: 6),
        priority: Faker::Number.between(from: 0, to: 10),
        project_id: project.id
        # value: random_integer
  )

end

50.times do
    task = Task.order('RANDOM()').first
    Developer.create(
        specilization: Faker::Job.position,

        name: Faker::Name.name,
        age: Faker::Number.between(from: 20, to: 60),
        phoneNo: Faker::PhoneNumber.cell_phone,
        email: Faker::Internet.email,
        task_id: task&.id,
        # status: Faker::Boolean.boolean
      )
end
