class RegistrationsController < Devise::RegistrationsController
 




  def create
      build_resource(sign_up_params)

      resource_saved = resource.save
      yield resource if block_given?
      if resource_saved
            if params[:user][:user_type] == "Employer"
              client = Client.create(name: params[:user][:company_name], user_id: resource.id )
              redirect_to client_path(client)
            elsif params[:user][:user_type] == "Freelancer"
              freelancer = Freelancer.create(first_name: params[:user][:first_name], last_name: params[:user][:last_name], user_id: resource.id )
              redirect_to freelancer_path(freelancer)
            else
              redirect_to root_path
           end
      else
        clean_up_passwords resource
        respond_with resource
      end
    end

  private
 
  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :user_type, :company_name)
  end
 
  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password, :user_type, :company_name)
  end
end