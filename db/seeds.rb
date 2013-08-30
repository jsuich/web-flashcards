# => Create User 10 times with Faker Gem

10.times do |i|
  User.create(
    email: Faker::Internet.email,
    password: "1234"
    )
end

(1..5).each do |deck_no|

  @deck_no = deck_no

  Deck.create(
    id: @deck_no,
    name: "#{Faker::Lorem.word.capitalize} English Words"
    )

  10.times do
    Card.create(
    deck_id: @deck_no,
    term: Faker::Lorem.word,
    definition: Faker::Lorem.sentence(word_count = 4, supplemental = false, random_words_to_add = 4)
    )
  end

end
