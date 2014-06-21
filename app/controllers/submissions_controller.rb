class SubmissionsController < ApplicationController

 
  def new
    @job = Job.find(params[:job_id])
    @submission = Submission.new
  end

  def create
    @job = Job.find(params[:job_id])
    if Submission.find_by_job_id(@job.id)
      redirect_to job_path(@job)
    else
      @submission = Submission.new(params[:submission])
      @submission.job_id = @job.id
      freelancer = Freelancer.find_by_user_id(current_user.id) if current_user
      @submission.freelancer_id = freelancer.id if freelancer
      if @submission.save
        @job.status = "In Review"
        @job.save
        redirect_to job_path(@job)
      else
        flash.now[:errors] = @submission.errors.full_messages
        render :new
      end
    end
  end

  def edit
    @job = Job.find(params[:job_id])
    @submission = Submission.find(params[:id])
  end

  def update
    submission = Submission.find(params[:id])
    job = Job.find(params[:job_id])
    if submission.update_attributes(params[:submission])
      redirect_to job_path(job)
    else
      flash.now[:errors] = submission.errors.full_messages
      erb :edit
    end
  end

  def destroy
    submission = Submission.find(params[:id])
    submission.destroy


    redirect_to root_path
  end




end