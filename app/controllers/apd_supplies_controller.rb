class ApdSuppliesController < ApplicationController
  before_filter :authenticate_admin!

  def index
    @apd_supplies = ApdSupply.all
  end

  def show
    @apd_supply = ApdSupply.find(params[:id])
  end

  def new
    @apd_supply = ApdSupply.new
  end

  def create
    @apd_supply = ApdSupply.new(params[:apd_supply])
    if @apd_supply.save
      redirect_to @apd_supply, :notice => "Successfully created apd supply."
    else
      render :action => 'new'
    end
  end

  def edit
    @apd_supply = ApdSupply.find(params[:id])
  end

  def update
    @apd_supply = ApdSupply.find(params[:id])
    if @apd_supply.update_attributes(params[:apd_supply])
      redirect_to @apd_supply, :notice  => "Successfully updated apd supply."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @apd_supply = ApdSupply.find(params[:id])
    @apd_supply.destroy
    redirect_to apd_supplies_url, :notice => "Successfully destroyed apd supply."
  end
end
