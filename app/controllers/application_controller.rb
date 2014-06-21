class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

  def is_logged_in_freelancer?(current_freelancer)
  	if current_user && current_user.user_type == "Freelancer"
  		freelancer = Freelancer.find_by_user_id(current_user.id)
  		if current_freelancer.id == freelancer.id 
  			return true
  		else
  			return false
  		end
  	else
  		return false
  	end
  end

  def is_logged_in_client?(current_client)
  	if current_user && current_user.user_type == "Employer"
  		client = Client.find_by_user_id(current_user.id)
  		if current_client.id == client.id
  			return true
  		else
  			return false
  		end
  	else
  		return false
  	end
  end

  def can_freelancer_see?(job)
    if current_user && current_user.user_type == "Freelancer"
      freelancer = Freelancer.find_by_user_id(current_user.id)
      if freelancer.level >= job.tier_requested
        return true
      else
        return false
      end
    else
      return false
    end
  end


      protected

      def configure_permitted_parameters
        devise_parameter_sanitizer.for(:sign_up) << :account_type
        devise_parameter_sanitizer.for(:account_update) << :account_type
      end

 




end
