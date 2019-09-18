class ContributionsController < ApplicationController
  before_action :find_contribution, only: [:show, :edit, :update, :destroy]

  def index
    if params[:contributor_id]
      @contributions = Contributor.find(params[:contributor_id]).contributions.all_by_date
    elsif params[:candidate_id]
      @contributions = Candidate.find(params[:candidate_id]).contributions.all_by_date
    else
      @contributions = Contribution.all_by_date
    end

    respond_to do |format|
      format.html
      format.json { render json: @contributions }
    end
  end

  def show
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
  end

  def update
    @contribution.update(contribution_params)
    redirect_to contribution_path(@contribution)
  end

  def destroy
    @contribution.destroy
    redirect_to contributions_path
  end

  private

  def find_contribution
    @contribution = Contribution.find(params[:id])
  end

  def contribution_params
    params.require(:contribution).permit(:amount, :date, :contributor_name, :candidate_name, :contributor_id, :candidate_id)
  end
end
