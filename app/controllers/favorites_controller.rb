class FavoritesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_candidate!

  def create
    current_user.favorite(@candidate)
    render 'candidates/show'
  end

  def destroy
    current_user.unfavorite(@candidate)
    render 'candidates/show'
  end

  private

  def find_candidate!
    @candidate = Candidate.find_by(params[:id])
  end
end
