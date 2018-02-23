class JokesController < ApplicationController
    before_action :authenticate_user!, only: [:like]
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
        result = Favorite.add(params[:joke_id], current_user.id)
        {return_code: 0, return_info: 'ok'}
    end

    private

    def authenticate_user!
        unless user_login?
            return render json: {return_code: 4001, return_info: 'user not login'}
        end
    end

end
