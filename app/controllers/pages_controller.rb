class PagesController < ApplicationController
  def home
  	if current_user && current_user.user_type == "Employer"
  		@client = Client.find_by_user_id(current_user.id)
  	end
  end
end