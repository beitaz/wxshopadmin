class StaticController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    skip_authorization # 跳过开发环境中的强制权限验证方法 verify_authorized
  end
end
