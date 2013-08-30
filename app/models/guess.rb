class Guess < ActiveRecord::Base
  
  validates :input, presence: true

  after_create :correct_answer?

  has_one :card

  def correct_answer?("user's guess")
    self.correctness = (boolean_statement)
    boolean_statement = ("user's guess" == Card.where().definition
  end


end

User's Guess == Correct Answer

Correct Answer is Card.definition
Which card? Card where card.id == guess.card_id
