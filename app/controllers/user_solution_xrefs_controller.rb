class UserSolutionXrefsController < ApplicationController
  before_filter :authenticate_admin!

  def index
    @user_solution_xrefs = UserSolutionXref.all
  end

  def show
    @user_solution_xref = UserSolutionXref.find(params[:id])
  end

  def new
    @user_solution_xref = UserSolutionXref.new
  end

  def create
    @user_solution_xref = UserSolutionXref.new(params[:user_solution_xref])
    if @user_solution_xref.save
      redirect_to @user_solution_xref, :notice => "Successfully created user solution xref."
    else
      render :action => 'new'
    end
  end

  def edit
    @user_solution_xref = UserSolutionXref.find(params[:id])
  end

  def update
    @user_solution_xref = UserSolutionXref.find(params[:id])
    if @user_solution_xref.update_attributes(params[:user_solution_xref])
      redirect_to @user_solution_xref, :notice  => "Successfully updated user solution xref."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @user_solution_xref = UserSolutionXref.find(params[:id])
    @user_solution_xref.destroy
    redirect_to user_solution_xrefs_url, :notice => "Successfully destroyed user solution xref."
  end
end
