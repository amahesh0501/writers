class CreateEarnings < ActiveRecord::Migration
  def change
    create_table :earnings do |t|
    	t.belongs_to :freelancer
    	t.belongs_to :editor
    	t.belongs_to :job
    	t.belongs_to :client
    	t.float :amount

    	t.timestamps
    end
  end
end
