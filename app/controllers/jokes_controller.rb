class JokesController < ApplicationController
    before_action :authenticate_user!, only: [:like, :unlike]
    skip_before_action :verify_authenticity_token, only: [:like, :unlike]
    def list
        jokes = Joke.pick_5
        render json: {"return_code":0, "return_info": "success", "jokes": jokes}
    end

    def index
    end

    def share
    end

    def like
        return render json: {"return_code": 4000, "return_info": "need joke's id"} unless params[:joke_id]
        render json: Favorite.add(params[:joke_id], current_user.id)
    end

    def unlike
        return render json: {"return_code": 4000, "return_info": "need joke's id"} unless params[:joke_id]
        render json: Favorite.remove(params[:joke_id], current_user.id)
    end

end
