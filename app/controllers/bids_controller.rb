class BidsController < ApplicationController

 
  def new
    @job = Job.find(params[:job_id])
    @bid = Bid.new
  end

  def create
    @bid = Bid.new(params[:bid])
    @job = Job.find(params[:job_id])
    @bid.job_id = @job.id
    freelancer = Freelancer.find_by_user_id(current_user.id) if current_user
    @bid.freelancer_id = freelancer.id if freelancer
    if @bid.save
      redirect_to job_path(@job)
    else
      flash.now[:errors] = @bid.errors.full_messages
      render :new
    end
  end

  def edit
    @job = Job.find(params[:job_id])
    @bid = Bid.find(params[:id])
  end

  def update
    bid = Bid.find(params[:id])
    job = Job.find(params[:job_id])
    if bid.update_attributes(params[:bid])
      redirect_to job_path(job)
    else
      flash.now[:errors] = bid.errors.full_messages
      erb :edit
    end
  end

  def destroy
    bid = Bid.find(params[:id])
    bid.destroy


    redirect_to root_path
  end

  def accept_bid
    accepted_bid = Bid.find(params[:bid_id])
    job = Job.find(params[:job_id])
    bids = job.bids
    if job.status == "Open"
      bids.each do |bid|
        bid.status = "Rejetced"
        bid.save
      end
      freelancer = Freelancer.find(accepted_bid.freelancer_id)
      accepted_bid.status = "Accepted"
      job.status = "Started"
      job.freelancer_id = freelancer.id
      accepted_bid.save
      job.save
    end
    redirect_to job_path(job)
  end


end