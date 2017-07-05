User.create!(name:  "Example",
             email: "example@example.com",
             password:              "foobar",
             password_confirmation: "foobar")

9.times do
  name = Faker::Name.name
  email = Faker::Internet.email
  password = Faker::Internet.password
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password)
end

25.times do
  title = Faker::Hipster.sentence(Random.rand(1..3))[0...-1]
  body = Faker::Hipster.paragraphs(Random.rand(1..3), true).join("\n\n")
  user_id = Random.rand(1..User.count)
  Post.create!(title: title,
               body: body,
               user_id: user_id)
end
