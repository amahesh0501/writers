class FreelancersController < ApplicationController

  def index
    @freelancers = Freelancer.all
  end

  def show
    @freelancer = Freelancer.find(params[:id])
    @current_jobs = Job.where(freelancer_id: @freelancer.id, status: "Started")
    @past_jobs = Job.where(freelancer_id: @freelancer.id, status: "Completed")
    @current_editor_jobs = Job.where(editor_id: @freelancer.id, status: "Started")
    @past_editor_jobs = Job.where(editor_id: @freelancer.id, status: "Completed")
    @can_access = is_logged_in_freelancer?(@freelancer)
    redirect_to root_path if @can_access == false
  end

  def new
    authenticate_user!
    @freelancer = Freelancer.new
  end

  def create
    authenticate_user!
    if Freelancer.find_by_user_id(current_user.id)
        redirect_to root_path
    else
      @freelancer = Freelancer.new(params[:freelancer])
      if @freelancer.save
        redirect_to freelancer_path(@freelancer)
      else
        flash.now[:errors] = @freelancer.errors.full_messages
        render :new
      end
    end
  end

  def edit
    authenticate_user!
    @freelancer = Freelancer.find(params[:id])
  end

  def update
    authenticate_user!
    freelancer = Freelancer.find(params[:id])
    if freelancer.update_attributes(params[:freelancer])
      redirect_to freelancer_path(freelancer)
    else
      flash.now[:errors] = freelancer.errors.full_messages
      erb :edit
    end
  end

  def destroy
    freelancer = Freelancer.find(params[:id])
    freelancer.destroy


    redirect_to root_path
  end


end