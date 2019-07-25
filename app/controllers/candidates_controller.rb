class CandidatesController < ApplicationController
  before_action :find_candidate, only: [:show, :edit, :update, :destroy]
  before_action :current_user, only: [:index]

  def index
    if params[:favorited]
      favorited_candidates(@current_user)
    else
      @candidates = Candidate.all_in_order
    end
  end

  def show
    @current_user = User.find_by(id: session[:user_id])
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
  end

  def update
    @candidate.update(candidate_params)
    redirect_to candidate_path(@candidate)
  end

  def destroy
    @candidate.destroy
    redirect_to candidates_path
  end

  private

  def current_user
    @current_user = User.find_by(id: session[:user_id])
  end

  def find_candidate
    @candidate = Candidate.find(params[:id])
  end

  def candidate_params
    params.require(:candidate).permit(:first_name, :last_name, :party_affiliation, :office_position, :location, :platform_outline, :favorites_count)
  end
end
