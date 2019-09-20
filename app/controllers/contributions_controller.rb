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

    render json: @contributions
  end

  def show
    respond_to do |f|
      f.html {render :show}
      f.json {render json: @contribution}
    end
  end

  def new
    @contribution = Contribution.new(contributor_id: params[:contributor_id], candidate_id: params[:candidate_id])
  end

  def create
    @contribution = Contribution.new(contribution_params)
    if @contribution.save
      render json: @contribution, status: 201
    else
      render json: { errors: @contribution.errors.full_messages }, status: 422
    end
  end

  def edit
  end

  def update
    @contribution.update(contribution_params)
    respond_to do |f|
      f.html {render :show}
      f.json {render json: @contribution}
    end
  end

  def destroy
    @contribution.destroy
    render json: @contributions
  end

  private

  def find_contribution
    @contribution = Contribution.find(params[:id])
  end

  def contribution_params
    params.require(:contribution).permit(:amount, :date, :contributor_name, :candidate_name, :contributor_id, :candidate_id)
  end
end
