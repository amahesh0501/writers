class CreateFreelancers < ActiveRecord::Migration
  def change
    create_table :freelancers do |t|
    	
        t.belongs_to :user
        t.string :first_name
    	t.string :last_name
    	t.string :location
        t.string :email
        t.string :phone
    	t.text :bio
    	t.integer :rating, default: 0
        t.integer :level, default: 1



    	t.timestamps


    end
  end
end
