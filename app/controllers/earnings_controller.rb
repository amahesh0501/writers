class EarningsController < ApplicationController

  def index
    @earnings = Earning.all
  end

  def show
    @earning = Earning.find(params[:id])
  end

  def new
    @earning = Earning.new
  end

  def create
    @earning = Earning.new(params[:earning])
    if @earning.save
      redirect_to earning_path(@earning)
    else
      flash.now[:errors] = @earning.errors.full_messages
      render :new
    end
  end

  def edit
    @earning = Earning.find(params[:id])
  end

  def update
    earning = Earning.find(params[:id])
    if earning.update_attributes(params[:earning])
      redirect_to earning_path(earning)
    else
      flash.now[:errors] = earning.errors.full_messages
      erb :edit
    end
  end

  def destroy
    earning = Earning.find(params[:id])
    earning.destroy


    redirect_to root_path
  end


end