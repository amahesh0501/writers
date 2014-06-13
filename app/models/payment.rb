class Payment < ActiveRecord::Base

  attr_accessible :amount
  validates :amount, presence: true
  belongs_to :freelancer
  belongs_to :editor

end