def create_user
  User.create(
    name: Faker::Internet.email
    password: "1234"
    )
end

5.times do |i|
  create_user
  # create_card   # => Create methods for the remaining two classes  
  # create_deck   # => that need to be seeded to the database

end

5.times do |i|
  User.create(
    name: Faker::Internet.email
    password: "1234"
    )
end
