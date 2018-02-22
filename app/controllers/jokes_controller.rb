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
        {return_code: 0, return_info: 'ok'}
    end

    private

    def authenticate_user!
        unless user_login?
            return render json: {return_code: 3000, return_info: 'user not login'}
        end
    end

end
