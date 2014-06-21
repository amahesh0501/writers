class Editor < ActiveRecord::Base

  attr_accessible :first_name, :last_name, :location, :description, :rating, :user_id, :phone, :email, :level
  validates :first_name, :last_name, presence: true
  has_many :payments
  has_many :earnings
  has_many :jobs
  belongs_to :user
  has_many :submissions


end