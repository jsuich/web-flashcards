class User < ActiveRecord::Base
  
  validates :email, uniqueness: true
  validates :email, presence: true
  validates :password, presence: true
  has_many :round
end
