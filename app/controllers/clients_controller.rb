class ClientsController < ApplicationController

  def index
    @clients = Client.all
  end

  def show
    @client = Client.find(params[:id])
    @open_jobs = Job.where(client_id: @client.id, status: "Open")
    @closed_jobs = Job.where(client_id: @client.id, status: "Complete")
    @started_jobs = Job.where(client_id: @client.id, status: "Started")
    @can_access = is_logged_in_client?(@client)
    redirect_to root_path if @can_access == false
  end

  def new
    authenticate_user!
    @client = Client.new
  end

  def create
    authenticate_user!
    if Client.find_by_user_id(current_user.id)
        redirect_to root_path
    else
      @client = Client.new(params[:client])
      @client.user_id = current_user.id
      if @client.save
        redirect_to client_path(@client)
      else
        flash.now[:errors] = @client.errors.full_messages
        render :new
      end
    end
  end

  def edit
    authenticate_user!
    @client = Client.find(params[:id])
  end

  def update
    authenticate_user!
    client = Client.find(params[:id])
    if client.update_attributes(params[:client])
      redirect_to client_path(client)
    else
      flash.now[:errors] = client.errors.full_messages
      erb :edit
    end
  end

  def destroy
    authenticate_user!
    client = Client.find(params[:id])
    client.destroy


    redirect_to root_path
  end


end