class Job < ActiveRecord::Base

  attr_accessible :title, :description, :due_date, :status, :word_count, :tier_requested, :per_word_charge, 
  :per_word_payment_to_writer, :per_word_payment_to_editor, :total_charge_to_client, :total_payment_to_writer, 
  :total_payment_to_writer,:writing_score, :editing_score,  :freelancer_id, :client_id, :editor_id
  validates :title, presence: true
  belongs_to :freelancer
  belongs_to :editor
  belongs_to :client
  has_many :bids
  has_many :messages
  has_one :submission

  def calculate_payments(tier, word_count)
  	if tier == 1.to_s
  		self.per_word_charge = 0.05 
  		self.per_word_payment_to_writer = 0.02 
  		self.per_word_payment_to_editor = 0.01
  		if word_count
  			self.total_charge_to_client = word_count.to_i * self.per_word_charge
  			self.total_payment_to_writer = word_count.to_i * self.per_word_payment_to_writer
  			self.total_payment_to_editor = word_count.to_i * self.per_word_payment_to_editor
  		end
  	end
  	if tier == 2.to_s
  		self.per_word_charge = 0.10
  		self.per_word_payment_to_writer = 0.04 
  		self.per_word_payment_to_editor = 0.02  
  		if word_count
  			self.total_charge_to_client = word_count.to_i * self.per_word_charge
  			self.total_payment_to_writer = word_count.to_i * self.per_word_payment_to_writer
  			self.total_payment_to_editor = word_count.to_i * self.per_word_payment_to_editor
  		end
  	end
  	if tier == 3.to_s
  		self.per_word_charge = 0.25
  		self.per_word_payment_to_writer = 0.10 
  		self.per_word_payment_to_editor = 0.05  
  		if word_count
  			self.total_charge_to_client = word_count.to_i * self.per_word_charge
  			self.total_payment_to_writer = word_count.to_i * self.per_word_payment_to_writer
  			self.total_payment_to_editor = word_count.to_i * self.per_word_payment_to_editor
  		end
  	end
  	if tier == 4.to_s
  		self.per_word_charge = 0.50
  		self.per_word_payment_to_writer = 0.20 
  		self.per_word_payment_to_editor = 0.10  
  		if word_count
  			self.total_charge_to_client = word_count.to_i * self.per_word_charge
  			self.total_payment_to_writer = word_count.to_i * self.per_word_payment_to_writer
  			self.total_payment_to_editor = word_count.to_i * self.per_word_payment_to_editor
  		end
  	end
  	if tier == 5.to_s
  		self.per_word_charge = 0.75
  		self.per_word_payment_to_writer = 0.25 
  		self.per_word_payment_to_editor = 0.15  
  		if word_count
  			self.total_charge_to_client = word_count.to_i * self.per_word_charge
  			self.total_payment_to_writer = word_count.to_i * self.per_word_payment_to_writer
  			self.total_payment_to_editor = word_count.to_i * self.per_word_payment_to_editor
  		end
  	end
  end

end