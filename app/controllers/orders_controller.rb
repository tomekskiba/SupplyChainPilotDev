class OrdersController < ApplicationController
  before_filter :authenticate_admin!, :only => [:destroy, :index]
  before_filter :authenticate_user! #, :except => [:about]

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
    @user = current_user
  end

  def confirmed
    #if !@order.valid?
    # render :action => 'show'
    #else
    #   redirect_to "/orders/confirmed/"+@order.id
    #end
    @user = current_user
    @order = Order.find(params[:id])
    if @order.update_attributes(params[:order])
      Emailer.patient_order_confirmation(current_user).deliver
      Emailer.representative_order_notification(current_user, @order).deliver
      #redirect_to "/orders/confirmed/"+@order.id.to_s
    else
      #render :action => 'show'
      order = Order.find(params[:id])
      order.opt_in = params[:order][:opt_in]
      order.save
      redirect_to "/orders/"+@order.id.to_s, :alert => "Please accept Baxter Delivery Terms & Conditions."
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