class CapdSuppliesController < ApplicationController
  before_filter :authenticate_admin!

  def index
    @capd_supplies = CapdSupply.all
  end

  def show
    @capd_supply = CapdSupply.find(params[:id])
  end

  def new
    @capd_supply = CapdSupply.new
  end

  def create
    @capd_supply = CapdSupply.new(params[:capd_supply])
    if @capd_supply.save
      redirect_to @capd_supply, :notice => "Successfully created capd supply."
    else
      render :action => 'new'
    end
  end

  def edit
    @capd_supply = CapdSupply.find(params[:id])
  end

  def update
    @capd_supply = CapdSupply.find(params[:id])
    if @capd_supply.update_attributes(params[:capd_supply])
      redirect_to @capd_supply, :notice  => "Successfully updated capd supply."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @capd_supply = CapdSupply.find(params[:id])
    @capd_supply.destroy
    redirect_to capd_supplies_url, :notice => "Successfully destroyed capd supply."
  end
end
