class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

   attr_accessible :user_type, :email, :password, :password_confirmation, :first_name, :last_name, :company_name


  has_one :client
  has_one :freelancer
  has_one :editor

end
