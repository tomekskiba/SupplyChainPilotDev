class OrdersController < ApplicationController
  before_filter :authenticate_admin!, :only => [:destroy, :index]
  before_filter :authenticate_user!

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
    @user = current_user
  end

  def confirmed
    @user = current_user
    @order = Order.find(params[:id])
    if @order.update_attributes(params[:order])
      Emailer.patient_order_confirmation(current_user).deliver
      Emailer.representative_order_notification(@user, @order).deliver
    else
      order = Order.find(params[:id])
      order.opt_in = params[:order][:opt_in]
      order.save
      render :action => 'show'
    end
  end

  def new
    @order = Order.new
    @user = current_user
  end

  def create
    @user = current_user
    @order = Order.new(params[:order])
    if @order.save
      redirect_to @order
    else
      render :action => 'new'
    end
  end

  def edit
    @order = Order.find(params[:id])
    @user = current_user
  end

  def update
    @user = current_user
    @order = Order.find(params[:id])
    if @order.update_attributes(params[:order])
      redirect_to @order
    else
      render :action => 'edit'
    end
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    redirect_to orders_url, :notice => "Successfully destroyed order."
  end
end