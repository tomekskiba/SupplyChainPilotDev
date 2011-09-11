class OrderCapdSupplyXrefsController < ApplicationController
  before_filter :authenticate_admin!

  def index
    @order_capd_supply_xrefs = OrderCapdSupplyXref.all
  end

  def show
    @order_capd_supply_xref = OrderCapdSupplyXref.find(params[:id])
  end

  def new
    @order_capd_supply_xref = OrderCapdSupplyXref.new
  end

  def create
    @order_capd_supply_xref = OrderCapdSupplyXref.new(params[:order_capd_supply_xref])
    if @order_capd_supply_xref.save
      redirect_to @order_capd_supply_xref, :notice => "Successfully created order capd supply xref."
    else
      render :action => 'new'
    end
  end

  def edit
    @order_capd_supply_xref = OrderCapdSupplyXref.find(params[:id])
  end

  def update
    @order_capd_supply_xref = OrderCapdSupplyXref.find(params[:id])
    if @order_capd_supply_xref.update_attributes(params[:order_capd_supply_xref])
      redirect_to @order_capd_supply_xref, :notice  => "Successfully updated order capd supply xref."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @order_capd_supply_xref = OrderCapdSupplyXref.find(params[:id])
    @order_capd_supply_xref.destroy
    redirect_to order_capd_supply_xrefs_url, :notice => "Successfully destroyed order capd supply xref."
  end
end
