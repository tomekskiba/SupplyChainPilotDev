class OrderSolutionXrefsController < ApplicationController
  before_filter :authenticate_admin!

  def index
    @order_solution_xrefs = OrderSolutionXref.all
  end

  def show
    @order_solution_xref = OrderSolutionXref.find(params[:id])
  end

  def new
    @order_solution_xref = OrderSolutionXref.new
  end

  def create
    @order_solution_xref = OrderSolutionXref.new(params[:order_solution_xref])
    if @order_solution_xref.save
      redirect_to @order_solution_xref, :notice => "Successfully created order solution xref."
    else
      render :action => 'new'
    end
  end

  def edit
    @order_solution_xref = OrderSolutionXref.find(params[:id])
  end

  def update
    @order_solution_xref = OrderSolutionXref.find(params[:id])
    if @order_solution_xref.update_attributes(params[:order_solution_xref])
      redirect_to @order_solution_xref, :notice  => "Successfully updated order solution xref."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @order_solution_xref = OrderSolutionXref.find(params[:id])
    @order_solution_xref.destroy
    redirect_to order_solution_xrefs_url, :notice => "Successfully destroyed order solution xref."
  end
end
