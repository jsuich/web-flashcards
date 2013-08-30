class Deck < ActiveRecord::Base
  
  validates :name, uniqueness: true
  validates :name, presence: true

  has_many :cards
  has_many :rounds
end
