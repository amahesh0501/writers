class Message < ActiveRecord::Base

  attr_accessible :title, :description, :freelancer_id, :job_id
  validates :description, presence: true
  belongs_to :freelancer
  belongs_to :job

end