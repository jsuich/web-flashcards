class Card < ActiveRecord::Base
  
  validates :term, uniqueness: true
  validates :term, presence: true
  validates :definition, presence: true

  has_many :answer

end
