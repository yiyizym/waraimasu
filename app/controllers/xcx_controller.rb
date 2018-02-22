require 'http'

class XcxController < ApplicationController
    def login
        raise 'need code to login' unless params["code"]
        
        return render json: {"return_code":0, "return_info": "already login"} if user_login?

        result = Xcx.login params["code"]

        return render json: result unless result[:return_code].equal?(0)

        user = 
            User.find_by(wechat_openid: result[:user_info]["openid"]) || 
            User.create({
                wechat_openid: result[:user_info]["openid"]
            })

        user_sign_in(user)

        render json: result.except(:user_info)
    rescue Exception => e
        logger.error e.message
        render json: {"return_code":100, "return_info": "params error"}
    end
end
