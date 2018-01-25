class JokesController < ApplicationController
  def list
    jokes = Joke.first_10
    render json: {"return_code":0, "return_info": "success", "jokes": jokes}
  end

  def index
  end

  def share
  end

  def like
  end
end
