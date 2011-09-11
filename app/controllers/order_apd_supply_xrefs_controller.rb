class OrderApdSupplyXrefsController < ApplicationController
  before_filter :authenticate_admin!

  def index
    @order_apd_supply_xrefs = OrderApdSupplyXref.all
  end

  def show
    @order_apd_supply_xref = OrderApdSupplyXref.find(params[:id])
  end

  def new
    @order_apd_supply_xref = OrderApdSupplyXref.new
  end

  def create
    @order_apd_supply_xref = OrderApdSupplyXref.new(params[:order_apd_supply_xref])
    if @order_apd_supply_xref.save
      redirect_to @order_apd_supply_xref, :notice => "Successfully created order apd supply xref."
    else
      render :action => 'new'
    end
  end

  def edit
    @order_apd_supply_xref = OrderApdSupplyXref.find(params[:id])
  end

  def update
    @order_apd_supply_xref = OrderApdSupplyXref.find(params[:id])
    if @order_apd_supply_xref.update_attributes(params[:order_apd_supply_xref])
      redirect_to @order_apd_supply_xref, :notice  => "Successfully updated order apd supply xref."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @order_apd_supply_xref = OrderApdSupplyXref.find(params[:id])
    @order_apd_supply_xref.destroy
    redirect_to order_apd_supply_xrefs_url, :notice => "Successfully destroyed order apd supply xref."
  end
end
