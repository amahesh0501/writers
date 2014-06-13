class CreateEditors < ActiveRecord::Migration
  def change
    create_table :editors do |t|
    	t.string :first_name
    	t.string :last_name
    	t.string :location
    	t.text :bio
    	t.integer :rating

    	t.timestamps
    end
  end
end
