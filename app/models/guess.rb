class Guess < ActiveRecord::Base
  
  validates :input, presence: true

  after_create :correct_answer?

  has_one :card

  def correct_answer?("user's guess")
    "user's guess" == definition on card
  end


end
