class Deck < ActiveRecord::Base
  
  validates :name, uniqueness: true
  validates :name, presence: true

  has_many :card
  has_many :round
end
