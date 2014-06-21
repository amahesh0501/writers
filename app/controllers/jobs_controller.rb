class JobsController < ApplicationController

  def index
    if current_user && current_user.user_type == "Freelancer"
      freelancer = Freelancer.find_by_user_id(current_user.id)
      @jobs = Job.where(status: "Open").where("tier_requested <= ?", freelancer.level)
      @edit_jobs = Job.where(editor_id: nil).where("tier_requested <= ?", freelancer.level).where("freelancer_id != ?", freelancer.id).where("status != ?", "Open")
    else
      redirect_to root_path
    end
   
  end

  def show
    redirect_to root_path unless current_user
    
    @job = Job.find(params[:id])
    @messages = @job.messages
    @hired_freelancer = false
    @hired_editor = false
    @posted_client = false
    @freelancer = Freelancer.find(@job.freelancer_id) if @job.freelancer_id
    @editor = Freelancer.find(@job.editor_id) if @job.editor_id

    if current_user && current_user.user_type == "Freelancer"
      @current_freelance_viewer = Freelancer.find_by_user_id(current_user.id)
      @hired_freelancer = true if  @job.freelancer_id == @current_freelance_viewer.id 
      @hired_editor = true if  @job.editor_id == @current_freelance_viewer.id 
      @can_freelancer_see = can_freelancer_see?(@job)
      redirect_to root_path unless @can_freelancer_see == true
    end
    
    if current_user && current_user.user_type == "Employer"
      client = Client.find_by_user_id(current_user.id)
      @posted_client = true if @job.client_id == client.id
    end


  end

  def new
    if current_user.user_type == "Employer"
      @job = Job.new
    else
      redirect_to root_path
    end
  end

  def create
    @job = Job.new(params[:job])
    client = Client.find_by_user_id(current_user.id)
    @job.client_id = client.id
    @job.tier_requested = params[:tier_requested]
    @job.calculate_payments(params[:tier_requested], params[:job][:word_count])
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
    job.tier_requested = params[:tier_requested]
    job.calculate_payments(params[:tier_requested], params[:job][:word_count])
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

  def claim_job_writer
    job = Job.find(params[:job_id])
    freelancer = Freelancer.find(params[:freelancer_id])
    if job.status == "Open"
      job.status = "Started"
      job.freelancer_id = freelancer.id
      job.save
    end
    redirect_to job_path(job)
  end

  def claim_job_editor
    job = Job.find(params[:job_id])
    editor = Freelancer.find(params[:freelancer_id])
    if job.status != "Open" && job.freelancer_id != editor.id
      job.editor_id = editor.id
      job.save
    end
    redirect_to job_path(job)
  end


  def mark_job_as_completed
    @job = Job.find(params[:job_id])
    @job.status = "Completed"
    @job.save
    redirect_to job_path(@job)
  end

  def score_writer
    job = Job.find(params[:job_id])
    writer = Freelancer.find(params[:writer_id])
    score = params[:score]

    if job.writing_score = nil
        redirect_to job_path(job) 
    else
      job.writing_score = score
      job.status = "Client Review"
      job.save
      case score
        when "1"
          writer.rating = writer.rating - 20
          if writer.rating < 0
            if writer.level = 1
              writer.rating = 0
            else
              writer.level = writer.level - 1
              writer.rating = 75
            end
          end
          writer.save
        when "2"
          writer.rating = writer.rating - 15
          if writer.rating < 0
            if writer.level = 1
              writer.rating = 0
            else
              writer.level = writer.level - 1
              writer.rating = 75
            end
          end
          writer.save
        when "3"
          writer.rating = writer.rating - 10
          if writer.rating < 0
            if writer.level = 1
              writer.rating = 0
            else
              writer.level = writer.level - 1
              writer.rating = 75
            end
          end
          writer.save
        when "4"
          writer.rating = writer.rating - 5
          if writer.rating < 0
            if writer.level = 1
              writer.rating = 0
            else
              writer.level = writer.level - 1
              writer.rating = 75
            end
          end
          writer.save
        when "5"
          writer.rating = writer.rating + 0
          writer.save
        when "6"
          writer.rating = writer.rating + 2
          if writer.rating > 100
            writer.level = writer.level + 1
            writer.rating = 0
          end
          writer.save
        when "7"
          writer.rating = writer.rating + 4
          if writer.rating > 100
            writer.level = writer.level + 1
            writer.rating = 0
          end
          writer.save
        when "8"
          writer.rating = writer.rating + 7
          if writer.rating > 100
            writer.level = writer.level + 1
            writer.rating = 0
          end
          writer.save
        when "9"
          writer.rating = writer.rating + 10
          if writer.rating > 100
            writer.level = writer.level + 1
            writer.rating = 0
          end
          writer.save
        when "10"
          writer.rating = writer.rating + 12
          if writer.rating > 100
            writer.level = writer.level + 1
            writer.rating = 0
          end
          writer.save
        else
          writer.save
        end
        redirect_to job_path(job)
      end
  end

  def score_editor
    job = Job.find(params[:job_id])
    editor = Freelancer.find(params[:editor_id])
    score = params[:score]
    if job.editing_score = nil
      redirect_to redirect_to job_path(job) 
    else
      job.editing_score = score
      job.status = "Complete"
      job.save
      case score
        when "1"
          editor.rating = editor.rating - 20
          if editor.rating < 0
            if editor.level = 1
              editor.rating = 0
            else
              editor.level = editor.level - 1
              editor.rating = 75
            end
          end
          editor.save
        when "2"
          editor.rating = editor.rating - 15
          if editor.rating < 0
            if editor.level = 1
              editor.rating = 0
            else
              editor.level = editor.level - 1
              editor.rating = 75
            end
          end
          editor.save
        when "3"
          editor.rating = editor.rating - 10
          if editor.rating < 0
            if editor.level = 1
              editor.rating = 0
            else
              editor.level = editor.level - 1
              editor.rating = 75
            end
          end
          editor.save
        when "4"
          editor.rating = editor.rating - 5
          if editor.rating < 0
            if editor.level = 1
              editor.rating = 0
            else
              editor.level = editor.level - 1
              editor.rating = 75
            end
          end
          editor.save
        when "5"
          editor.rating = editor.rating + 0
          editor.save
        when "6"
          editor.rating = editor.rating + 2
          if editor.rating > 100
            editor.level = editor.level + 1
            editor.rating = 0
          end
          editor.save
        when "7"
          editor.rating = editor.rating + 4
          if editor.rating > 100
            editor.level = editor.level + 1
            editor.rating = 0
          end
          editor.save
        when "8"
          editor.rating = editor.rating + 7
          if editor.rating > 100
            editor.level = editor.level + 1
            editor.rating = 0
          end
          editor.save
        when "9"
          editor.rating = editor.rating + 10
          if editor.rating > 100
            editor.level = editor.level + 1
            editor.rating = 0
          end
          editor.save
        when "10"
          editor.rating = editor.rating + 12
          if editor.rating > 100
            editor.level = editor.level + 1
            editor.rating = 0
          end
          editor.save
        else
          editor.save
        end
        redirect_to job_path(job)
      end

  end



end