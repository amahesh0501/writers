class Client < ActiveRecord::Base

  attr_accessible :name, :website, :location, :description
  validates :name, presence: true
  has_many :earnings
  has_many :jobs

end