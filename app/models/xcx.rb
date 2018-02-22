class Xcx < ApplicationRecord
    def self.login(code)

        resp = HTTP.get("https://api.weixin.qq.com/sns/jscode2session", :params => {appid: ENV['APP_ID'], secret: ENV['APP_SECRET'], js_code: code, grant_type: "authorization_code"})
        raise "response error: #{resp}" unless resp.code.equal?(200)
        
        resp = JSON.parse resp.body
        raise "business error: #{resp}" unless resp[:openid]

        session[:current_user_openid] = resp[:session_key]

        {"return_code":0, "return_info": "success"}

    rescue Exception => e
        logger.error e
        {"return_code":1, "return_info": "error"}
    end
end