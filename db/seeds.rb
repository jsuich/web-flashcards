def create_user
  User.create(
    name: Faker::Internet.email
    password: "1234"
    )
end

5.times do |i|
  create_user
  create_
end

5.times do |i|
  User.create(
    name: Faker::Internet.email
    password: "1234"
    )
end
