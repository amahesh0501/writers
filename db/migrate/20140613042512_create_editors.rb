class CreateEditors < ActiveRecord::Migration
  def change
    create_table :editors do |t|
    	t.belongs_to :user

        t.string :email
        t.string :phone
        t.string :first_name
    	t.string :last_name
    	t.string :location
    	t.text :bio
        t.string :email
        t.string :phone
        t.integer :rating, default: 0
        t.integer :level, default: 1

    	t.timestamps
    end
  end
end
