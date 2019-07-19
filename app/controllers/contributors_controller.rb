class ContributorsController < ApplicationController
  def index
    @contributors = Contributor.all
  end

  def show
    find_contributor
  end

  def new
    @candidate = Contributor.new
  end

  def create
    @contributor = Contributor.new(contributor_params)
    if @candidate.save
      redirect_to contributor_path(@contributor)
    else
      render :new
    end
  end

  def edit
    find_contributor
  end

  def update
    find_contributor
    @contributor.update(contributor_params)
    redirect_to contributor_path(@contributor)
  end

  def destroy
    find_contributor.destroy
    redirect_to contributor_path
  end

  private

  def find_contributor
    @contributor = Contributor.find(params[:id])
  end

  def contributor_params
    params.require(:contributor).permit(:name, :category, :industry_affiliation)
  end
end
