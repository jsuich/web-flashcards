class Deck < ActiveRecord::Base
  
  has_many :card
  has_many :round
end
