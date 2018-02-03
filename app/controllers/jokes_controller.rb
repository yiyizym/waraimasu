class JokesController < ApplicationController
  def list
    jokes = Joke.pick_5
    render json: {"return_code":0, "return_info": "success", "jokes": jokes}
  end

  def index
  end

  def share
  end

  def like
  end
end
