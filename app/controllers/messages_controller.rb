class MessagesController < ApplicationController

 
  def new
    @job = Job.find(params[:job_id])
    @message = Message.new
  end

  def create
    @job = Job.find(params[:job_id])
    @message = Message.new(params[:message])
    @message.job_id = @job.id
    freelancer = Freelancer.find_by_user_id(current_user.id) if current_user
    @message.freelancer_id = freelancer.id if freelancer
    if @message.save
      redirect_to job_path(@job)
    else
      flash.now[:errors] = @message.errors.full_messages
      render :new
    end

  end

  def edit
    @job = Job.find(params[:job_id])
    @message = Message.find(params[:id])
  end

  def update
    message = Message.find(params[:id])
    job = Job.find(params[:job_id])
    if message.update_attributes(params[:message])
      redirect_to job_path(job)
    else
      flash.now[:errors] = message.errors.full_messages
      erb :edit
    end
  end

  def destroy
    message = Message.find(params[:id])
    job = Job.find(message.job_id)
    message.destroy
    redirect_to job_path(job)
  end




end