class UserCapdSupplyXrefsController < ApplicationController
  before_filter :authenticate_admin!

  def index
    @user_capd_supply_xrefs = UserCapdSupplyXref.all
  end

  def show
    @user_capd_supply_xref = UserCapdSupplyXref.find(params[:id])
  end

  def new
    @user_capd_supply_xref = UserCapdSupplyXref.new
  end

  def create
    @user_capd_supply_xref = UserCapdSupplyXref.new(params[:user_capd_supply_xref])
    if @user_capd_supply_xref.save
      redirect_to @user_capd_supply_xref, :notice => "Successfully created user capd supply xref."
    else
      render :action => 'new'
    end
  end

  def edit
    @user_capd_supply_xref = UserCapdSupplyXref.find(params[:id])
  end

  def update
    @user_capd_supply_xref = UserCapdSupplyXref.find(params[:id])
    if @user_capd_supply_xref.update_attributes(params[:user_capd_supply_xref])
      redirect_to @user_capd_supply_xref, :notice  => "Successfully updated user capd supply xref."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @user_capd_supply_xref = UserCapdSupplyXref.find(params[:id])
    @user_capd_supply_xref.destroy
    redirect_to user_capd_supply_xrefs_url, :notice => "Successfully destroyed user capd supply xref."
  end
end
