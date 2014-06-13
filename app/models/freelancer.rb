class Freelancer < ActiveRecord::Base

  attr_accessible :first_name, :last_name, :location, :description, :rating
  validates :first_name, :last_name, presence: true
  has_many :payments
  has_many :earnings
  has_many :jobs

end