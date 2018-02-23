class FavoritesController < ApplicationController
  before_action :authenticate_user!, only: [:list]

  def list
    favorites = Favorite.last_5(current_user.id)
    render json: favorites
  end
end