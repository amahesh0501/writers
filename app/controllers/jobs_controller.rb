class JobsController < ApplicationController

  def index
    @jobs = Job.all
  end

  def show
    @job = Job.find(params[:id])
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(params[:job])
    if @job.save
      redirect_to job_path(@job)
    else
      flash.now[:errors] = @job.errors.full_messages
      render :new
    end
  end

  def edit
    @job = Job.find(params[:id])
  end

  def update
    job = Job.find(params[:id])
    if job.update_attributes(params[:job])
      redirect_to job_path(job)
    else
      flash.now[:errors] = job.errors.full_messages
      erb :edit
    end
  end

  def destroy
    job = Job.find(params[:id])
    job.destroy


    redirect_to root_path
  end


end