class Freelancer < ActiveRecord::Base

  attr_accessible :first_name, :last_name, :location, :bio, :rating, :user_id, :phone, :email, :level
  validates :first_name, :last_name, presence: true
  has_many :payments
  has_many :earnings
  has_many :jobs
  belongs_to :user
  has_many :bids
  has_many :submissions
  has_many :messages


end