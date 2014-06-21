class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
    	t.belongs_to :user

        t.string :email
    	t.string :phone
    	t.string :name
    	t.string :location
    	t.text :description
    	t.string :website
    	t.string :email
    	t.string :phone



    	t.timestamps
    end
  end
end
