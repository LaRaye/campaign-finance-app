class FavoritesController < ApplicationController
  before_action :current_user
  before_action :find_candidate

  def create
    if @current_user.favorite(@candidate)
      redirect_to candidate_path(@candidate), notice: "Candidate has been favorited"
    end 
  end

  def destroy
    @current_user.unfavorite(@candidate)
    redirect_to candidate_path(@candidate), notice: "Candidate has been unfavorited"
  end

  private

  def current_user
    @current_user = User.find_by(id: session[:user_id])
  end

  def find_candidate
    @candidate = Candidate.find_by(params[:id])
  end
end
