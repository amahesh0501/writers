class CreateBids < ActiveRecord::Migration
  def change
    create_table :bids do |t|
    	t.belongs_to :job
    	t.belongs_to :freelancer
    	t.float :amount
    	t.string :status, default: "Currently Active"
    end
  end
end
