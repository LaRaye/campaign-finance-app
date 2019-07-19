class CandidatesController < ApplicationController

  def index
    @candidates = Candidate.all
  end

  def show
    find_candidate
  end

  def new
    @candidate = Candidate.new
  end

  def create
    @candidate = Candidate.new(candidate_params)
    if @candidate.save
      redirect_to candidate_path(@candidate)
    else
      render :new
    end
  end

  def edit
    find_candidate
  end

  def update
    find_candidate
    @candidate.update(candidate_params)
    redirect_to candidate_path(@candidate)
  end

  def destroy
    find_candidate.destroy
    redirect_to candidates_path
  end

  private

  def find_candidate
    @candidate = Candidate.find(params[:id])
  end

  def candidate_params
    params.require(:candidate).permit(:first_name, :last_name, :party_affiliation, :office_position, :location, :platform_outline)
  end
end
