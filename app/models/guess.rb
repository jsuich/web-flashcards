class Guess < ActiveRecord::Base
  
  validates :input, presence: true

  after_create :correct_answer?

  has_one :card

  def set_correct_answer!

    @card = Card.where(id: self.card_id)

    self.correctness = (self.input == @card.definition)
    self.save
  end

end
