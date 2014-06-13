class PaymentsController < ApplicationController

  def index
    @payments = Payment.all
  end

  def show
    @payment = Payment.find(params[:id])
  end

  def new
    @payment = Payment.new
  end

  def create
    @payment = Payment.new(params[:payment])
    if @payment.save
      redirect_to payment_path(@payment)
    else
      flash.now[:errors] = @payment.errors.full_messages
      render :new
    end
  end

  def edit
    @payment = Payment.find(params[:id])
  end

  def update
    payment = Payment.find(params[:id])
    if payment.update_attributes(params[:payment])
      redirect_to payment_path(payment)
    else
      flash.now[:errors] = payment.errors.full_messages
      erb :edit
    end
  end

  def destroy
    payment = Payment.find(params[:id])
    payment.destroy


    redirect_to root_path
  end


end