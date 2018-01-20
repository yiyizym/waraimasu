class JokesController < ApplicationController
  def list
    jokes = ['1','2','3','4','5','6','7','8','9']
    render json: {"return_code":0, "return_info": "success", "jokes": jokes}
  end

  def index
  end

  def share
  end

  def like
  end
end
