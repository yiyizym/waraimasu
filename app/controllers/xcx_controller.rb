require 'http'

class XcxController < ApplicationController
    def login
        raise 'need code to login' unless params[:code]

        result = Xcx.login params[:code]

        render json: result
    rescue Exception => e
        logger.error e.message
        render json: {"return_code":100, "return_info": "params error"}
    end
end
