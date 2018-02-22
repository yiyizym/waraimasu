require 'http'

class XcxController < ApplicationController
    def login
        raise 'need code to login' unless params["code"]
        result = Xcx.login params["code"]
        session[:current_user_openid] = result[:user_info]["session_key"] if result[:return_code].equal?(0)
        render json: result.except(:user_info)
    rescue Exception => e
        logger.error e.message
        render json: {"return_code":100, "return_info": "params error"}
    end
end
