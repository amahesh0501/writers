class Client < ActiveRecord::Base

  attr_accessible :name, :website, :location, :description, :user_id, :phone, :email
  validates :name, presence: true
  has_many :earnings
  has_many :jobs
  belongs_to :user

end