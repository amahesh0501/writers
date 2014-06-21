class Bid < ActiveRecord::Base

  attr_accessible :amount, :status, :freelancer_id, :job_id
  validates :amount, presence: true
  belongs_to :freelancer
  belongs_to :job

end