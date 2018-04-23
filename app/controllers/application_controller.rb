# frozen_string_literal: true

class ApplicationController < ActionController::Base
  layout :whole_partial
  include Pundit
  protect_from_forgery
  before_action :configure_permitted_parameters, if: :devise_controller?
  # 必须在 authenticate_user! 认证之前存储 "访问历史",因为存储行为会打乱正常的跳转流程，防止认证错误
  before_action :store_user_location!, if: :storable_location?
  before_action :authenticate_user!
  after_action :verify_authorized, unless: :devise_controller?
  # after_action :verify_policy_scoped, only: :index, unless: :active_admin_controller?
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  protected

    def after_sign_in_path_for(resource)
      (current_user ? stored_location_for(resource) : rails_admin_path) || super
    end

    def after_sign_out_path_for(resource)
      stored_location_for(resource) || super
    end

    def configure_permitted_parameters
      attrs = [:email, :password, :password_confirmation, :remember_me]
      devise_parameter_sanitizer.permit(:sign_up, keys: attrs)
      devise_parameter_sanitizer.permit(:sign_in, keys: attrs)
      devise_parameter_sanitizer.permit(:account_update, keys: attrs)
    end

  private

    def whole_partial
      # 当前用户是管理员才使用局部布局（显示左边菜单栏）
      return 'application' if current_user&.admin?
      'whole'
    end

    # 在下列情况时判断所访问的 URL 是否可存储是非常重要的：
    # - 该请求不是 GET 方法 (non idempotent)
    # - 该请求由 Devise 控制器（如Devise :: SessionsController）处理，可能导致无限重定向循环
    # - 该请求是一个 Ajax 请求，可能会导致非常意外的行为
    def storable_location?
      request.get? && is_navigational_format? && !devise_controller? && !request.xhr?
    end

    def store_user_location!
      store_location_for(:user, request.fullpath)
    end

    # def active_admin_controller?
    #   is_a?(ActiveAdmin::BaseController)
    # end

    def user_not_authorized(exception)
      # flash[:error] = 'You are not authorized to perform this action.'
      # redirect_to(request.referrer || root_path)
      # flash[:alert] = 'You are not authorized to perform this action.'
      # 一些浏览器不支持 HTTP referer header （即不支持 request.referer 方式），所以只能用 Devise 内建的 store_location_for
      # redirect_to(request.referrer || root_path) # 重定向到请求前的 URL 或者 根路径

      # 自定义异常信息（默认 pundit.default = 'You are not authorized to perform this action.'）
      policy_name = exception.policy.class.to_s.underscore
      flash[:error] = t("#{policy_name}.#{exception.query}", scope: 'pundit', default: :default)
      redirect_to(request.referrer || root_path)
    end
end
