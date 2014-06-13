class FreelancersController < ApplicationController

  def index
    @freelancers = Freelancer.all
  end

  def show
    @freelancer = Freelancer.find(params[:id])
  end

  def new
    @freelancer = Freelancer.new
  end

  def create
    @freelancer = Freelancer.new(params[:freelancer])
    if @freelancer.save
      redirect_to freelancer_path(@freelancer)
    else
      flash.now[:errors] = @freelancer.errors.full_messages
      render :new
    end
  end

  def edit
    @freelancer = Freelancer.find(params[:id])
  end

  def update
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