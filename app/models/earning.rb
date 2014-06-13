class Earning < ActiveRecord::Base

  attr_accessible :amount
  validates :amount, presence: true
  belongs_to :freelancer
  belongs_to :editor
  belongs_to :client

end