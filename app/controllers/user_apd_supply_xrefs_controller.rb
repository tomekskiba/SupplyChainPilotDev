class UserApdSupplyXrefsController < ApplicationController
  before_filter :authenticate_admin!

  def index
    @user_apd_supply_xrefs = UserApdSupplyXref.all
  end

  def show
    @user_apd_supply_xref = UserApdSupplyXref.find(params[:id])
  end

  def new
    @user_apd_supply_xref = UserApdSupplyXref.new
  end

  def create
    @user_apd_supply_xref = UserApdSupplyXref.new(params[:user_apd_supply_xref])
    if @user_apd_supply_xref.save
      redirect_to @user_apd_supply_xref, :notice => "Successfully created user apd supply xref."
    else
      render :action => 'new'
    end
  end

  def edit
    @user_apd_supply_xref = UserApdSupplyXref.find(params[:id])
  end

  def update
    @user_apd_supply_xref = UserApdSupplyXref.find(params[:id])
    if @user_apd_supply_xref.update_attributes(params[:user_apd_supply_xref])
      redirect_to @user_apd_supply_xref, :notice  => "Successfully updated user apd supply xref."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @user_apd_supply_xref = UserApdSupplyXref.find(params[:id])
    @user_apd_supply_xref.destroy
    redirect_to user_apd_supply_xrefs_url, :notice => "Successfully destroyed user apd supply xref."
  end
end
