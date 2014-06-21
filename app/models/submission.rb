class Submission < ActiveRecord::Base

  attr_accessible :link, :status, :freelancer_id, :editor_id, :job_id
  belongs_to :freelancer
  belongs_to :editor
  belongs_to :job

end