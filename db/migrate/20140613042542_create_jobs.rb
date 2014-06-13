class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
    	t.belongs_to :client
    	t.belongs_to :freelancer
    	t.belongs_to :editor
    	t.string :title
    	t.text :description
    	t.float :amount
    	t.date :due_date

    	t.timestamps
    end
  end
end
