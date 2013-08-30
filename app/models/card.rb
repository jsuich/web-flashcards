class Card < ActiveRecord::Base
  
  has_many :guess
  
end
