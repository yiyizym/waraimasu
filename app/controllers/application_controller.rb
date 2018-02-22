class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :detect_device_variant

  helper_method :current_user

  private

  def user_login?
    current_user.present?
  end

  def current_user
    @_current_user ||= session[:current_user_id] && User.find_by(id: session[:current_user_id])
  end

  def user_sign_in(user)
    session[:current_user_id] = user.id
  end

  def user_sign_out
    session[:current_user_id] = nil
    @_current_user = nil
  end
  

  def detect_device_variant
    request.variant = :phone if browser.device.mobile?
  end
end
