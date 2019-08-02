class FavoritesController < ApplicationController
  before_action :current_user
  before_action :find_candidate

  def create
    @current_user.favorite(@candidate)
    redirect_to candidate_path(@candidate), notice: "Candidate has been favorited"
  end

  def destroy
    @current_user.unfavorite(@candidate)
    redirect_to candidate_path(@candidate), notice: "Candidate has been unfavorited"
  end

  private

  def current_user
    @current_user = User.find(session[:user_id])
  end

  def find_candidate
    @candidate = Candidate.find(params[:candidate_id])
  end
end
