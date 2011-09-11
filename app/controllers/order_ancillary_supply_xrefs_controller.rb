class OrderAncillarySupplyXrefsController < ApplicationController
  before_filter :authenticate_admin!

  def index
    @order_ancillary_supply_xrefs = OrderAncillarySupplyXref.all
  end

  def show
    @order_ancillary_supply_xref = OrderAncillarySupplyXref.find(params[:id])
  end

  def new
    @order_ancillary_supply_xref = OrderAncillarySupplyXref.new
  end

  def create
    @order_ancillary_supply_xref = OrderAncillarySupplyXref.new(params[:order_ancillary_supply_xref])
    if @order_ancillary_supply_xref.save
      redirect_to @order_ancillary_supply_xref, :notice => "Successfully created order ancillary supply xref."
    else
      render :action => 'new'
    end
  end

  def edit
    @order_ancillary_supply_xref = OrderAncillarySupplyXref.find(params[:id])
  end

  def update
    @order_ancillary_supply_xref = OrderAncillarySupplyXref.find(params[:id])
    if @order_ancillary_supply_xref.update_attributes(params[:order_ancillary_supply_xref])
      redirect_to @order_ancillary_supply_xref, :notice  => "Successfully updated order ancillary supply xref."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @order_ancillary_supply_xref = OrderAncillarySupplyXref.find(params[:id])
    @order_ancillary_supply_xref.destroy
    redirect_to order_ancillary_supply_xrefs_url, :notice => "Successfully destroyed order ancillary supply xref."
  end
end
