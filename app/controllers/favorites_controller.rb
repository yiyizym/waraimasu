class FavoritesController < ApplicationController
  before_action :authenticate_user!, only: [:list]

  def list
    favorites = Favorite.last_5
    render json: favorites
  end
end