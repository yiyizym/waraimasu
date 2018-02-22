class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :detect_device_variant

  helper_method :current_user

  private

  def user_login?
    current_user.present?
  end

  def current_user
    @_current_user ||= session[:current_user_openid] && User.find_by(wechat_openid: session[:current_user_openid])
  end

  def user_sign_in(user)
    session[:current_user_openid] = user.wechat_openid
  end

  def user_sign_out
    session[:current_user_openid] = nil
    @_current_user = nil
  end
  

  def detect_device_variant
    request.variant = :phone if browser.device.mobile?
  end
end
