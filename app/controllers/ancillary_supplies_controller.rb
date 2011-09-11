class AncillarySuppliesController < ApplicationController
  before_filter :authenticate_admin!

  def index
    @ancillary_supplies = AncillarySupply.all
  end

  def show
    @ancillary_supply = AncillarySupply.find(params[:id])
  end

  def new
    @ancillary_supply = AncillarySupply.new
  end

  def create
    @ancillary_supply = AncillarySupply.new(params[:ancillary_supply])
    if @ancillary_supply.save
      redirect_to @ancillary_supply, :notice => "Successfully created ancillary supply."
    else
      render :action => 'new'
    end
  end

  def edit
    @ancillary_supply = AncillarySupply.find(params[:id])
  end

  def update
    @ancillary_supply = AncillarySupply.find(params[:id])
    if @ancillary_supply.update_attributes(params[:ancillary_supply])
      redirect_to @ancillary_supply, :notice  => "Successfully updated ancillary supply."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @ancillary_supply = AncillarySupply.find(params[:id])
    @ancillary_supply.destroy
    redirect_to ancillary_supplies_url, :notice => "Successfully destroyed ancillary supply."
  end
end
