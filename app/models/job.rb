class Job < ActiveRecord::Base

  attr_accessible :title, :description, :amount, :due_date
  validates :title, :amount, presence: true
  belongs_to :freelancer
  belongs_to :editor
  belongs_to :client

end