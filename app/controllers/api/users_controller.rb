class Api::UsersController < Api::BaseController
  # skip_before_action :authenticate_user!

  # 绑定手机号
  def register
    skip_authorization
    result = {
      code: 10_001,
      msg: '验证码错误!'
    }
    verify_code = $redis.get(params[:mobile])
    if verify_code == params[:verification_code]
      Visitor.update_all(mobile: params[:mobile], openid: params[:openid])
      result[:code] = 0
      result[:msg] = '绑定成功'
    end
    render json: result
  end

  # "我"(用户信息)
  def info
    skip_authorization
    render json: Visitor.find_by(openid: params[:openid])
  end

  # 我的订单
  def orders
    skip_authorization
    result = {
      code: 10_001,
      msg: '订单获取失败'
    }
    orders = Order.where(visitor_id: params[:openid], status: params[:order_status], category: params[:type])
    result[:list] = orders
    result[:code] = 0
    result[:total_count] = orders.size
    result[:page_total] = (result[:total_count] / params[:size].to_i).ceil
    result[:msg] = '订单已获取'
    render json: result
  end

  # 添加用户足迹
  def browsed
    skip_authorization
    if sign_verify
      visitor = Visitor.find_by(uid: params[:openid])
      GoodVisitor.visit(visitor.id, params[:id])
      @result = {
        code: 0,
        msg: '足迹已保存'
      }
    end
    render json: @result
  end

  # 我的收藏
  def favorites
    skip_authorization
    if sign_verify
      visitor = Visitor.find_by(uid: params[:openid])
      favorites = visitor.goods
      list = favorites.offset((params[:page].to_i - 1) * params[:size].to_i)
      page_total = (favorites.size / params[:size].to_i).ceil
      @result = {
        code: 0,
        list: list,
        page_total: page_total,
        msg: '已获取收藏'
      }
    end
    render json: @result
  end
end
