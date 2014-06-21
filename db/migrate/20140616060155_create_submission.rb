class CreateSubmission < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
    	t.belongs_to :job
    	t.belongs_to :freelancer
    	t.belongs_to :editor
    	t.string :status, default: "Not Started Yet"
    	t.string :link
    end
  end
end
