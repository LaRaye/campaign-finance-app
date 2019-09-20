class ContributorsController < ApplicationController
  before_action :find_contributor, only: [:show, :edit, :update, :destroy]

  def index
    @contributors = Contributor.all

    render json: @contributors
  end

  def show
    render json: @contributor
  end

  def new
    @contributor = Contributor.new
  end

  def create
    @contributor = Contributor.new(contributor_params)
    if @contributor.save
      redirect_to contributor_path(@contributor)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @contributor.update(contributor_params)
    redirect_to contributor_path(@contributor)
  end

  def destroy
    @contributor.destroy
    redirect_to contributors_path
  end

  private

  def find_contributor
    @contributor = Contributor.find(params[:id])
  end

  def contributor_params
    params.require(:contributor).permit(:name, :category, :industry_affiliation)
  end
end
