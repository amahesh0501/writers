class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
    	t.belongs_to :freelancer
    	t.belongs_to :job

    	t.string :title
    	t.text :description

    	t.timestamps


    end
  end
end
