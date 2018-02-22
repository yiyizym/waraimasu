class Xcx < ApplicationRecord
    def self.login(code)

        resp = HTTP.get("https://api.weixin.qq.com/sns/jscode2session", :params => {appid: ENV['WARAIMASU_APP_ID'], secret: ENV['WARAIMASU_APP_SECRET'], js_code: code, grant_type: "authorization_code"})
        raise "response error: #{resp}" unless resp.code.equal?(200)
        
        user_info = JSON.parse resp.body
        raise "business error: #{user_info}" unless user_info["openid"]

        {"return_code":0, "return_info": "success", "user_info": user_info}

    rescue Exception => e
        logger.error e
        {"return_code":1, "return_info": "error"}
    end
end