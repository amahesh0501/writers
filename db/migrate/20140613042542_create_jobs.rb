class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
    	t.belongs_to :client
    	t.belongs_to :freelancer
    	t.belongs_to :editor
    	t.string :title
    	t.text :description
        t.string :status, default: "Open"
    	t.date :due_date
        t.integer :tier_requested
        t.integer :word_count
        t.float :per_word_charge
        t.float :per_word_payment_to_writer
        t.float :per_word_payment_to_editor
        t.float :total_charge_to_client
        t.float :total_payment_to_writer
        t.float :total_payment_to_editor
        t.integer :writing_score
        t.integer :editing_score



    	t.timestamps
    end
  end
end
