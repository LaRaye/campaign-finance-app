class ContributionsController < ApplicationController
  def new
    @contribution = Contribution.new
  end

  def create
    @contribution = Contribution.new
    if @contribution.save
      redirect_to contribution_path(@contribution)
    else
      render :new 
    end
  end

end
