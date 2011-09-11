class UserAncillarySupplyXrefsController < ApplicationController
  before_filter :authenticate_admin!

  def index
    @user_ancillary_supply_xrefs = UserAncillarySupplyXref.all
  end

  def show
    @user_ancillary_supply_xref = UserAncillarySupplyXref.find(params[:id])
  end

  def new
    @user_ancillary_supply_xref = UserAncillarySupplyXref.new
  end

  def create
    @user_ancillary_supply_xref = UserAncillarySupplyXref.new(params[:user_ancillary_supply_xref])
    if @user_ancillary_supply_xref.save
      redirect_to @user_ancillary_supply_xref, :notice => "Successfully created user ancillary supply xref."
    else
      render :action => 'new'
    end
  end

  def edit
    @user_ancillary_supply_xref = UserAncillarySupplyXref.find(params[:id])
  end

  def update
    @user_ancillary_supply_xref = UserAncillarySupplyXref.find(params[:id])
    if @user_ancillary_supply_xref.update_attributes(params[:user_ancillary_supply_xref])
      redirect_to @user_ancillary_supply_xref, :notice  => "Successfully updated user ancillary supply xref."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @user_ancillary_supply_xref = UserAncillarySupplyXref.find(params[:id])
    @user_ancillary_supply_xref.destroy
    redirect_to user_ancillary_supply_xrefs_url, :notice => "Successfully destroyed user ancillary supply xref."
  end
end
