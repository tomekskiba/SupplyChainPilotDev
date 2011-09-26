class UsersController < ApplicationController
  before_filter :authenticate_admin!

  def index
    @users = User.order("last_name").order("first_name").paginate(:page => params[:page], :per_page => 40)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to users_path, :notice => "Successfully updated user."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path, :notice => "Successfully deleted user."
  end

end
