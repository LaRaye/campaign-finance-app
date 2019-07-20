class ContributionsController < ApplicationController
  def index
    if params[:contributor_id]
      @contributions = Contributor.find(params[:contributor_id]).contributions
    elsif params[:candidate_id]
      @contributions = Candidate.find(params[:candidate_id]).contributions
    else
      @contributions = Contribution.all
    end
  end

  def show
    find_contribution
  end

  def new
    @contribution = Contribution.new(contributor_id: params[:contributor_id], candidate_id: params[:candidate_id])
  end

  def create
    @contribution = Contribution.new(contribution_params)
    if @contribution.save
      redirect_to contribution_path(@contribution)
    else
      render :new
    end
  end

  def edit
    find_contribution
  end

  def update
    find_contribution
    @contribution.update(contribution_params)
    redirect_to contribution_path(@contribution)
  end

  def destroy
    find_contribution.destroy
    redirect_to contributions_path
  end

  private

  def find_contribution
    @contribution = Contribution.find(params[:id])
  end

  def contribution_params
    params.require(:contribution).permit(:amount, :date, :contributor_name, :candidate_name)
  end
end
