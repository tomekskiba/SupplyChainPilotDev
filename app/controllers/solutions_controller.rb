class SolutionsController < ApplicationController
  def index
    @solutions = Solution.all
  end

  def show
    @solution = Solution.find(params[:id])
  end

  def new
    @solution = Solution.new
  end

  def create
    @solution = Solution.new(params[:solution])
    if @solution.save
      redirect_to @solution, :notice => "Successfully created solution."
    else
      render :action => 'new'
    end
  end

  def edit
    @solution = Solution.find(params[:id])
  end

  def update
    @solution = Solution.find(params[:id])
    if @solution.update_attributes(params[:solution])
      redirect_to @solution, :notice  => "Successfully updated solution."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @solution = Solution.find(params[:id])
    @solution.destroy
    redirect_to solutions_url, :notice => "Successfully destroyed solution."
  end
end
